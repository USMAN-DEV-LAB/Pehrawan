import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';

/// Live countdown timer for Flash Sale rails.
class FlashSaleTimer extends StatefulWidget {
  const FlashSaleTimer({super.key, required this.endTime});

  final DateTime endTime;

  @override
  State<FlashSaleTimer> createState() => _FlashSaleTimerState();
}

class _FlashSaleTimerState extends State<FlashSaleTimer> {
  Timer? _timer;
  late Duration _remaining;

  @override
  void initState() {
    super.initState();
    _updateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(_updateRemaining);
      }
    });
  }

  void _updateRemaining() {
    final diff = widget.endTime.difference(DateTime.now());
    _remaining = diff.isNegative ? Duration.zero : diff;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final hours = _twoDigits(_remaining.inHours);
    final minutes = _twoDigits(_remaining.inMinutes.remainder(60));
    final seconds = _twoDigits(_remaining.inSeconds.remainder(60));

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _TimeBox(value: hours),
        const _Colon(),
        _TimeBox(value: minutes),
        const _Colon(),
        _TimeBox(value: seconds),
      ],
    );
  }
}

class _TimeBox extends StatelessWidget {
  const _TimeBox({required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: colors.onSurface,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        value,
        style: theme.textTheme.labelMedium?.copyWith(
          color: colors.surface,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _Colon extends StatelessWidget {
  const _Colon();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Text(
        ':',
        style: Theme.of(context).textTheme.labelLarge
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
