import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pehrawan/core/theme/app_spacing.dart';

/// 6-digit OTP input boxes with auto-advance, backspace navigation, and paste support.
class OtpPinInput extends StatefulWidget {
  const OtpPinInput({
    super.key,
    required this.onChanged,
    required this.onCompleted,
    this.length = 6,
  });

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onCompleted;
  final int length;

  @override
  State<OtpPinInput> createState() => _OtpPinInputState();
}

class _OtpPinInputState extends State<OtpPinInput> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String get _currentCode => _controllers.map((c) => c.text).join();

  void _handleTextChange(int index, String value) {
    final digits = value.replaceAll(RegExp(r'\D'), '');

    // Handle paste of multiple digits
    if (digits.length > 1) {
      for (int i = 0; i < widget.length; i++) {
        _controllers[i].text = i < digits.length ? digits[i] : '';
      }
      final nextFocus = digits.length >= widget.length
          ? widget.length - 1
          : digits.length;
      _focusNodes[nextFocus].requestFocus();
      final code = _currentCode;
      widget.onChanged(code);
      if (code.length == widget.length) {
        widget.onCompleted(code);
      }
      return;
    }

    if (digits.isNotEmpty) {
      _controllers[index].text = digits;
      _controllers[index].selection = const TextSelection.collapsed(offset: 1);
      if (index + 1 < widget.length) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    } else if (index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final code = _currentCode;
    widget.onChanged(code);
    if (code.length == widget.length) {
      widget.onCompleted(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Directionality(
      // OTP digits are always entered left-to-right even in Urdu RTL mode.
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(widget.length, (index) {
          return SizedBox(
            width: 46,
            height: 52,
            child: TextField(
              key: ValueKey('otp_box_$index'),
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: theme.textTheme.titleLarge,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
              ),
              onChanged: (val) => _handleTextChange(index, val),
            ),
          );
        }),
      ),
    );
  }
}
