/// Application-wide constants and configurable endpoints.
abstract final class AppConstants {
  /// Configurable base URL for placeholder product & banner images.
  /// Override via `--dart-define=IMAGE_BASE_URL=...` in release/staging builds.
  static const String imageBaseUrl = String.fromEnvironment(
    'IMAGE_BASE_URL',
    defaultValue: 'https://picsum.photos/seed',
  );

  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.pehrawan.pk/v1',
  );

  static const bool useMockData = bool.fromEnvironment(
    'USE_MOCK_DATA',
    defaultValue: true,
  );

  static const String whatsappSupportNumber = '+923001234567';
  static const String privacyPolicyUrl = 'https://pehrawan.pk/privacy';
  static const String termsUrl = 'https://pehrawan.pk/terms';

  static const int defaultPageSize = 12;
}
