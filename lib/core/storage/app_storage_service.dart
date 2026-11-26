import 'package:hive_flutter/hive_flutter.dart';

/// Local key-value storage wrapper backed by Hive for preferences,
/// onboarding flags, and recent searches.
class AppStorageService {
  static const String _prefsBoxName = 'pehrawan_prefs';
  static const String _keyOnboardingDone = 'onboarding_done';
  static const String _keyLanguageCode = 'language_code';
  static const String _keyRecentSearches = 'recent_searches';
  static const String _keyGuestMode = 'guest_mode';

  Future<Box<dynamic>> _openBox() async {
    if (Hive.isBoxOpen(_prefsBoxName)) {
      return Hive.box<dynamic>(_prefsBoxName);
    }
    return Hive.openBox<dynamic>(_prefsBoxName);
  }

  Future<bool> hasCompletedOnboarding() async {
    final box = await _openBox();
    return (box.get(_keyOnboardingDone) as bool?) ?? false;
  }

  Future<void> setOnboardingCompleted(bool value) async {
    final box = await _openBox();
    await box.put(_keyOnboardingDone, value);
  }

  Future<String?> getSavedLanguageCode() async {
    final box = await _openBox();
    return box.get(_keyLanguageCode) as String?;
  }

  Future<void> saveLanguageCode(String code) async {
    final box = await _openBox();
    await box.put(_keyLanguageCode, code);
  }

  Future<bool> isGuestMode() async {
    final box = await _openBox();
    return (box.get(_keyGuestMode) as bool?) ?? false;
  }

  Future<void> setGuestMode(bool value) async {
    final box = await _openBox();
    await box.put(_keyGuestMode, value);
  }

  Future<List<String>> getRecentSearches() async {
    final box = await _openBox();
    final raw = box.get(_keyRecentSearches) as List<dynamic>?;
    return raw?.map((e) => e.toString()).toList() ?? const [];
  }

  Future<void> saveRecentSearches(List<String> queries) async {
    final box = await _openBox();
    await box.put(_keyRecentSearches, queries);
  }
}
