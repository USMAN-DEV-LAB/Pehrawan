import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/core/router/app_router.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/core/widgets/widgets.dart';

class LanguageSelectScreen extends ConsumerWidget {
  const LanguageSelectScreen({super.key});

  Future<void> _selectLanguage(WidgetRef ref, String code) async {
    ref.read(localeProvider.notifier).state = Locale(code);
    await ref.read(appStorageProvider).saveLanguageCode(code);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final currentCode = ref.watch(localeProvider).languageCode;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.lg),
              const Center(child: PehrawanLogo(markSize: 52)),
              const SizedBox(height: AppSpacing.xxl),
              Text(
                l10n.languageSelectTitle,
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                l10n.languageSelectSubtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              _LanguageOptionCard(
                title: l10n.english,
                subtitle: 'English (LTR)',
                selected: currentCode == 'en',
                onTap: () => _selectLanguage(ref, 'en'),
              ),
              const SizedBox(height: AppSpacing.sm),
              _LanguageOptionCard(
                title: l10n.urdu,
                subtitle: 'اردو (RTL)',
                selected: currentCode == 'ur',
                onTap: () => _selectLanguage(ref, 'ur'),
              ),
              const Spacer(),
              AppButton(
                label: l10n.continueLabel,
                onPressed: () async {
                  await ref
                      .read(appStorageProvider)
                      .saveLanguageCode(currentCode);
                  if (!context.mounted) return;
                  context.go(AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageOptionCard extends StatelessWidget {
  const _LanguageOptionCard({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = context.ext;

    return Semantics(
      button: true,
      selected: selected,
      label: title,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: selected ? colors.primaryContainer : colors.surface,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            border: Border.all(
              color: selected ? colors.primary : ext.border,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleLarge),
                    const SizedBox(height: 2),
                    Text(subtitle, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
              Icon(
                selected
                    ? Icons.check_circle_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: selected ? colors.primary : colors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
