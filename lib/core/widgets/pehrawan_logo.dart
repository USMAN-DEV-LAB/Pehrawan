import 'package:flutter/material.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';

/// Original vector Pehrawan logo: hanger-curve "P" mark + wordmark.
class PehrawanLogo extends StatelessWidget {
  const PehrawanLogo({
    super.key,
    this.color,
    this.showWordmark = true,
    this.showTagline = false,
    this.markSize = 44,
    this.wordmarkFontSize,
    this.horizontal = false,
  });

  final Color? color;
  final bool showWordmark;
  final bool showTagline;
  final double markSize;
  final double? wordmarkFontSize;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor = color ?? theme.colorScheme.primary;
    final l10n = context.l10n;

    final mark = CustomPaint(
      size: Size(markSize, markSize),
      painter: _HangerPMarkPainter(color: effectiveColor),
    );

    if (!showWordmark) return mark;

    final wordmark = Text(
      l10n.appName,
      textAlign: TextAlign.center,
      style: theme.textTheme.headlineMedium?.copyWith(
        fontSize: wordmarkFontSize,
        color: effectiveColor,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
      ),
    );

    if (horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          mark,
          const SizedBox(width: AppSpacing.xs),
          wordmark,
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        mark,
        const SizedBox(height: AppSpacing.xs),
        wordmark,
        if (showTagline) ...[
          const SizedBox(height: AppSpacing.xxs),
          Text(
            l10n.tagline,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: effectiveColor.withValues(alpha: 0.9),
            ),
          ),
        ],
      ],
    );
  }
}

class _HangerPMarkPainter extends CustomPainter {
  _HangerPMarkPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.085
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // Hanger hook at top
    final hookPath = Path()
      ..moveTo(w * 0.42, h * 0.22)
      ..cubicTo(w * 0.42, h * 0.08, w * 0.58, h * 0.08, w * 0.58, h * 0.20)
      ..lineTo(w * 0.50, h * 0.28);
    canvas.drawPath(hookPath, stroke);

    // Hanger shoulders + stylized "P" bowl & stem
    final pPath = Path()
      ..moveTo(w * 0.16, h * 0.44)
      ..lineTo(w * 0.50, h * 0.28)
      ..lineTo(w * 0.84, h * 0.44)
      ..cubicTo(w * 0.84, h * 0.62, w * 0.66, h * 0.64, w * 0.36, h * 0.64)
      ..moveTo(w * 0.36, h * 0.38)
      ..lineTo(w * 0.36, h * 0.88);
    canvas.drawPath(pPath, stroke);
  }

  @override
  bool shouldRepaint(covariant _HangerPMarkPainter oldDelegate) =>
      oldDelegate.color != color;
}
