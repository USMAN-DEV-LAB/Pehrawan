import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/core/router/app_router.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/widgets/widgets.dart';
import 'package:pehrawan/features/auth/presentation/providers/auth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key, this.autoNavigate = true});

  /// Allows widget tests to inspect Splash layout without triggering navigation.
  final bool autoNavigate;

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );
    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
    );
    _animController.forward();

    if (widget.autoNavigate) {
      _bootstrap();
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> _bootstrap() async {
    final storage = ref.read(appStorageProvider);
    final savedLang = await storage.getSavedLanguageCode();
    if (savedLang != null && mounted) {
      ref.read(localeProvider.notifier).state = Locale(savedLang);
    }

    final onboardingDone = await storage.hasCompletedOnboarding();
    final user = await ref.read(authControllerProvider.future);

    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;

    if (!onboardingDone) {
      context.go(AppRoutes.onboarding);
    } else if (user == null) {
      context.go(AppRoutes.login);
    } else {
      context.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colors.primary,
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.xl,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: PehrawanLogo(
                      key: const ValueKey('splash_logo'),
                      color: colors.onPrimary,
                      showTagline: true,
                      markSize: 96,
                      wordmarkFontSize: 32,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  key: const ValueKey('splash_loader'),
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
                    child: LinearProgressIndicator(
                      minHeight: 3,
                      backgroundColor: colors.onPrimary.withValues(alpha: 0.25),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colors.onPrimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
