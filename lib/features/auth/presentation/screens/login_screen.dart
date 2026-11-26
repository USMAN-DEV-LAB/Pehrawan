import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/errors/app_exception.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/router/app_router.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/utils/validators.dart';
import 'package:pehrawan/core/widgets/widgets.dart';
import 'package:pehrawan/features/auth/presentation/providers/auth_provider.dart';
import 'package:pehrawan/features/auth/presentation/widgets/otp_pin_input.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  String? _verificationId;
  String _otpCode = '';
  bool _isSendingOtp = false;
  String? _errorMessage;
  int _resendSeconds = 0;
  Timer? _resendTimer;

  @override
  void dispose() {
    _phoneController.dispose();
    _resendTimer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    _resendTimer?.cancel();
    setState(() => _resendSeconds = 60);
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      if (_resendSeconds <= 1) {
        timer.cancel();
        setState(() => _resendSeconds = 0);
      } else {
        setState(() => _resendSeconds--);
      }
    });
  }

  Future<void> _sendOtp() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _isSendingOtp = true;
      _errorMessage = null;
    });
    try {
      final verifId = await ref
          .read(authControllerProvider.notifier)
          .sendOtp(_phoneController.text.trim());
      if (!mounted) return;
      setState(() {
        _verificationId = verifId;
        _isSendingOtp = false;
      });
      _startResendTimer();
    } on AppException catch (e) {
      if (!mounted) return;
      setState(() {
        _isSendingOtp = false;
        _errorMessage = e.localizedMessage(context.isUrdu ? 'ur' : 'en');
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isSendingOtp = false;
        _errorMessage = context.l10n.errorGenericSubtitle;
      });
    }
  }

  Future<void> _verifyOtp() async {
    final l10n = context.l10n;
    if (!Validators.isValidOtp(_otpCode)) {
      setState(() => _errorMessage = l10n.otpInvalid);
      return;
    }
    setState(() => _errorMessage = null);
    await ref
        .read(authControllerProvider.notifier)
        .verifyOtp(
          verificationId: _verificationId ?? '',
          phoneNumber: _phoneController.text.trim(),
          otpCode: _otpCode,
        );
    if (!mounted) return;
    final state = ref.read(authControllerProvider);
    if (state.hasError) {
      setState(() => _errorMessage = l10n.errorGenericSubtitle);
    } else if (state.valueOrNull != null) {
      context.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final authState = ref.watch(authControllerProvider);
    final isAuthLoading = authState.isLoading;
    final isOtpSent = _verificationId != null;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.md),
                const Center(child: PehrawanLogo(markSize: 52)),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  isOtpSent ? l10n.otpVerification : l10n.loginTitle,
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  isOtpSent
                      ? l10n.otpSentTo(
                          Validators.normalizePakistaniPhone(
                            _phoneController.text.trim(),
                          ),
                        )
                      : l10n.loginSubtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                if (!isOtpSent) ...[
                  AppTextField(
                    controller: _phoneController,
                    label: l10n.mobileNumber,
                    hint: l10n.mobileNumberHint,
                    prefixText: '+92  ',
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _sendOtp(),
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return l10n.phoneRequired;
                      }
                      if (!Validators.isValidPakistaniPhone(val.trim())) {
                        return l10n.phoneInvalid;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppButton(
                    label: l10n.sendOtp,
                    isLoading: _isSendingOtp,
                    onPressed: _sendOtp,
                  ),
                ] else ...[
                  OtpPinInput(
                    onChanged: (code) => _otpCode = code,
                    onCompleted: (_) => _verifyOtp(),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(l10n.mockOtpHint, style: theme.textTheme.bodySmall),
                  const SizedBox(height: AppSpacing.md),
                  AppButton(
                    label: l10n.verifyAndContinue,
                    isLoading: isAuthLoading,
                    onPressed: _verifyOtp,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _resendTimer?.cancel();
                          setState(() {
                            _verificationId = null;
                            _otpCode = '';
                            _errorMessage = null;
                          });
                        },
                        child: Text(l10n.changeNumber),
                      ),
                      TextButton(
                        onPressed: _resendSeconds == 0 ? _sendOtp : null,
                        child: Text(
                          _resendSeconds > 0
                              ? l10n.resendOtpIn(_resendSeconds)
                              : l10n.resendOtp,
                        ),
                      ),
                    ],
                  ),
                ],
                if (_errorMessage != null) ...[
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    _errorMessage!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.error,
                    ),
                  ),
                ],
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                      ),
                      child: Text(
                        l10n.orContinueWith,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                AppButton(
                  label: l10n.signInWithGoogle,
                  variant: AppButtonVariant.outlined,
                  icon: Icons.g_mobiledata_rounded,
                  isLoading: isAuthLoading,
                  onPressed: () async {
                    await ref
                        .read(authControllerProvider.notifier)
                        .signInWithGoogle();
                    if (!context.mounted) return;
                    if (ref.read(authControllerProvider).valueOrNull != null) {
                      context.go(AppRoutes.home);
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.sm),
                AppButton(
                  label: l10n.continueAsGuest,
                  variant: AppButtonVariant.ghost,
                  onPressed: () async {
                    await ref
                        .read(authControllerProvider.notifier)
                        .continueAsGuest();
                    if (!context.mounted) return;
                    context.go(AppRoutes.home);
                  },
                ),
                if (kDebugMode) ...[
                  const SizedBox(height: AppSpacing.md),
                  TextButton.icon(
                    onPressed: () => context.push(AppRoutes.designSystem),
                    icon: const Icon(Icons.palette_outlined, size: 18),
                    label: Text(l10n.designSystemShowcase),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
