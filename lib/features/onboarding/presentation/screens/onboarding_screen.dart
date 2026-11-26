import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/core/router/app_router.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/core/widgets/widgets.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _finishOnboarding() async {
    await ref.read(appStorageProvider).setOnboardingCompleted(true);
    if (!mounted) return;
    context.go(AppRoutes.language);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final pages = [
      (
        title: l10n.onboardingTitle1,
        subtitle: l10n.onboardingSubtitle1,
        type: _IllustrationType.style,
      ),
      (
        title: l10n.onboardingTitle2,
        subtitle: l10n.onboardingSubtitle2,
        type: _IllustrationType.deals,
      ),
      (
        title: l10n.onboardingTitle3,
        subtitle: l10n.onboardingSubtitle3,
        type: _IllustrationType.delivery,
      ),
    ];

    final isLast = _currentPage == pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: _finishOnboarding,
                style: TextButton.styleFrom(
                  minimumSize: const Size(
                    AppSpacing.minTapTarget,
                    AppSpacing.minTapTarget,
                  ),
                ),
                child: Text(l10n.skip),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (idx) => setState(() => _currentPage = idx),
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.xl,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 1),
                        _OnboardingVectorIllustration(type: page.type),
                        const SizedBox(height: AppSpacing.xxl),
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.displaySmall?.copyWith(
                            fontSize: 26,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          page.subtitle,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (i) {
                final active = i == _currentPage;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: active ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: active ? colors.primary : colors.outline,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: AppButton(
                label: isLast ? l10n.getStarted : l10n.next,
                onPressed: () {
                  if (isLast) {
                    _finishOnboarding();
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 280),
                      curve: Curves.easeOut,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _IllustrationType { style, deals, delivery }

class _OnboardingVectorIllustration extends StatelessWidget {
  const _OnboardingVectorIllustration({required this.type});

  final _IllustrationType type;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final ext = context.ext;

    return SizedBox(
      width: 260,
      height: 260,
      child: CustomPaint(
        painter: _FlatVectorPainter(
          type: type,
          primary: colors.primary,
          blush: ext.blush,
          surface: colors.surface,
        ),
      ),
    );
  }
}

class _FlatVectorPainter extends CustomPainter {
  _FlatVectorPainter({
    required this.type,
    required this.primary,
    required this.blush,
    required this.surface,
  });

  final _IllustrationType type;
  final Color primary;
  final Color blush;
  final Color surface;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final blushFill = Paint()..color = blush;
    final primaryFill = Paint()..color = primary;
    final whiteStroke = Paint()
      ..color = surface
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Soft blush backdrop circle
    canvas.drawCircle(Offset(w * 0.5, h * 0.5), w * 0.44, blushFill);

    switch (type) {
      case _IllustrationType.style:
        // Stylized kurta/dress card + hanger
        final card = RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(w * 0.5, h * 0.52),
            width: w * 0.46,
            height: h * 0.54,
          ),
          const Radius.circular(18),
        );
        canvas.drawRRect(card, primaryFill);
        final hanger = Path()
          ..moveTo(w * 0.36, h * 0.44)
          ..lineTo(w * 0.50, h * 0.36)
          ..lineTo(w * 0.64, h * 0.44)
          ..moveTo(w * 0.50, h * 0.36)
          ..lineTo(w * 0.50, h * 0.30);
        canvas.drawPath(hanger, whiteStroke);
        canvas.drawLine(
          Offset(w * 0.40, h * 0.58),
          Offset(w * 0.60, h * 0.58),
          whiteStroke,
        );
      case _IllustrationType.deals:
        // Stylized sale tag
        final tag = RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(w * 0.5, h * 0.5),
            width: w * 0.48,
            height: h * 0.42,
          ),
          const Radius.circular(20),
        );
        canvas.drawRRect(tag, primaryFill);
        canvas.drawCircle(Offset(w * 0.36, h * 0.40), 7, blushFill);
        canvas.drawLine(
          Offset(w * 0.42, h * 0.60),
          Offset(w * 0.60, h * 0.42),
          whiteStroke,
        );
        canvas.drawCircle(Offset(w * 0.44, h * 0.46), 4, whiteStroke);
        canvas.drawCircle(Offset(w * 0.58, h * 0.56), 4, whiteStroke);
      case _IllustrationType.delivery:
        // Stylized parcel box with checkmark
        final box = RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(w * 0.5, h * 0.52),
            width: w * 0.48,
            height: h * 0.42,
          ),
          const Radius.circular(16),
        );
        canvas.drawRRect(box, primaryFill);
        final check = Path()
          ..moveTo(w * 0.38, h * 0.53)
          ..lineTo(w * 0.47, h * 0.62)
          ..lineTo(w * 0.63, h * 0.44);
        canvas.drawPath(check, whiteStroke);
    }
  }

  @override
  bool shouldRepaint(covariant _FlatVectorPainter oldDelegate) =>
      oldDelegate.type != type || oldDelegate.primary != primary;
}
