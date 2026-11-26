/// Typed application exceptions so raw exceptions never reach the UI.
sealed class AppException implements Exception {
  const AppException({required this.messageEn, required this.messageUr});

  final String messageEn;
  final String messageUr;

  String localizedMessage(String languageCode) =>
      languageCode == 'ur' ? messageUr : messageEn;

  @override
  String toString() => messageEn;
}

final class NetworkException extends AppException {
  const NetworkException({
    super.messageEn = 'Unable to connect. Please check your internet.',
    super.messageUr = 'کنکشن دستیاب نہیں۔ براہ کرم اپنا انٹرنیٹ چیک کریں۔',
  });
}

final class ServerException extends AppException {
  const ServerException({
    super.messageEn = 'Server error occurred. Please try again shortly.',
    super.messageUr =
        'سرور میں خرابی پیش آئی۔ براہ کرم تھوڑی دیر بعد کوشش کریں۔',
  });
}

final class AuthException extends AppException {
  const AuthException({
    super.messageEn = 'Authentication failed. Please sign in again.',
    super.messageUr = 'تصدیق ناکام ہو گئی۔ براہ کرم دوبارہ لاگ ان کریں۔',
  });
}

final class NotFoundException extends AppException {
  const NotFoundException({
    super.messageEn = 'The requested item could not be found.',
    super.messageUr = 'مطلوبہ چیز نہیں مل سکی۔',
  });
}

final class ValidationException extends AppException {
  const ValidationException({
    required super.messageEn,
    required super.messageUr,
  });
}
