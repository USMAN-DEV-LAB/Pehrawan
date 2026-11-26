/// Input validators for forms across the app.
abstract final class Validators {
  static final RegExp _pkPhoneLocal = RegExp(r'^03\d{9}$');
  static final RegExp _pkPhoneIntl = RegExp(r'^\+923\d{9}$');
  static final RegExp _otpRegex = RegExp(r'^\d{6}$');
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Validates Pakistani mobile numbers: `03XXXXXXXXX` or `+923XXXXXXXXX`.
  static bool isValidPakistaniPhone(String input) {
    final cleaned = input.replaceAll(RegExp(r'[\s\-]'), '');
    return _pkPhoneLocal.hasMatch(cleaned) || _pkPhoneIntl.hasMatch(cleaned);
  }

  /// Normalizes `03XXXXXXXXX` or `+923XXXXXXXXX` to `+923XXXXXXXXX`.
  static String normalizePakistaniPhone(String input) {
    final cleaned = input.replaceAll(RegExp(r'[\s\-]'), '');
    if (_pkPhoneLocal.hasMatch(cleaned)) {
      return '+92${cleaned.substring(1)}';
    }
    return cleaned;
  }

  static bool isValidOtp(String input) => _otpRegex.hasMatch(input.trim());

  static bool isValidEmail(String input) => _emailRegex.hasMatch(input.trim());
}
