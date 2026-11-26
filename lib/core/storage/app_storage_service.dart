import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pehrawan/features/cart/domain/entities/cart_entities.dart';

/// Local key-value storage wrapper backed by Hive for preferences,
/// onboarding flags, recent searches, guest cart, and wishlist.
/// Falls back to in-memory storage if Hive is not initialized (e.g. in unit tests).
class AppStorageService {
  static const String _prefsBoxName = 'pehrawan_prefs';
  static const String _keyOnboardingDone = 'onboarding_done';
  static const String _keyLanguageCode = 'language_code';
  static const String _keyRecentSearches = 'recent_searches';
  static const String _keyGuestMode = 'guest_mode';
  static const String _keyGuestCart = 'guest_cart_items';
  static const String _keyWishlistIds = 'wishlist_ids';
  static const String _keyPriceDropIds = 'price_drop_alert_ids';

  /// Set to true in `main.dart` after `Hive.initFlutter()` completes.
  static bool hiveReady = false;

  final Map<String, dynamic> _memoryFallback = {};

  Future<Box<dynamic>?> _openBox() async {
    if (!hiveReady) return null;
    try {
      if (Hive.isBoxOpen(_prefsBoxName)) {
        return Hive.box<dynamic>(_prefsBoxName);
      }
      return await Hive.openBox<dynamic>(_prefsBoxName);
    } catch (_) {
      return null;
    }
  }

  Future<dynamic> _read(String key) async {
    final box = await _openBox();
    if (box != null) return box.get(key);
    return _memoryFallback[key];
  }

  Future<void> _write(String key, dynamic value) async {
    final box = await _openBox();
    if (box != null) {
      await box.put(key, value);
    } else {
      _memoryFallback[key] = value;
    }
  }

  Future<bool> hasCompletedOnboarding() async =>
      (await _read(_keyOnboardingDone) as bool?) ?? false;

  Future<void> setOnboardingCompleted(bool value) =>
      _write(_keyOnboardingDone, value);

  Future<String?> getSavedLanguageCode() async =>
      await _read(_keyLanguageCode) as String?;

  Future<void> saveLanguageCode(String code) =>
      _write(_keyLanguageCode, code);

  Future<bool> isGuestMode() async =>
      (await _read(_keyGuestMode) as bool?) ?? false;

  Future<void> setGuestMode(bool value) => _write(_keyGuestMode, value);

  Future<List<String>> getRecentSearches() async {
    final raw = await _read(_keyRecentSearches) as List<dynamic>?;
    return raw?.map((e) => e.toString()).toList() ?? const [];
  }

  Future<void> saveRecentSearches(List<String> queries) =>
      _write(_keyRecentSearches, queries);

  Future<List<CartItem>> getSavedCartItems() async {
    final raw = await _read(_keyGuestCart) as String?;
    if (raw == null || raw.isEmpty) return const [];
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((e) => CartItem.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  Future<void> saveCartItems(List<CartItem> items) async {
    final encoded = jsonEncode(items.map((e) => e.toJson()).toList());
    await _write(_keyGuestCart, encoded);
  }

  Future<Set<String>> getWishlistIds() async {
    final raw = await _read(_keyWishlistIds) as List<dynamic>?;
    return raw?.map((e) => e.toString()).toSet() ?? {'prod_1', 'prod_16'};
  }

  Future<void> saveWishlistIds(Set<String> ids) =>
      _write(_keyWishlistIds, ids.toList());

  Future<Set<String>> getPriceDropAlertIds() async {
    final raw = await _read(_keyPriceDropIds) as List<dynamic>?;
    return raw?.map((e) => e.toString()).toSet() ?? <String>{};
  }

  Future<void> savePriceDropAlertIds(Set<String> ids) =>
      _write(_keyPriceDropIds, ids.toList());
}
