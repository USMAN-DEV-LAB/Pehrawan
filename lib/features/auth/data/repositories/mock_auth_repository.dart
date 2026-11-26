import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pehrawan/core/errors/app_exception.dart';
import 'package:pehrawan/core/storage/app_storage_service.dart';
import 'package:pehrawan/core/utils/validators.dart';
import 'package:pehrawan/features/auth/domain/repositories/auth_repository.dart';
import 'package:pehrawan/features/orders/domain/entities/order_entities.dart';

/// Mock authentication repository for offline/pre-Firebase development.
/// Accepts any valid Pakistani mobile number and any 6-digit OTP.
class MockAuthRepository implements AuthRepository {
  MockAuthRepository(this._secureStorage, this._appStorage);

  final FlutterSecureStorage _secureStorage;
  final AppStorageService _appStorage;

  static const _tokenKey = 'auth_token';
  static const _phoneKey = 'auth_phone';
  static const _nameKey = 'auth_name';

  @override
  Future<String> sendOtp(String phoneNumber) async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
    if (!Validators.isValidPakistaniPhone(phoneNumber)) {
      throw const ValidationException(
        messageEn: 'Enter a valid Pakistani mobile number.',
        messageUr: 'درست پاکستانی موبائل نمبر درج کریں۔',
      );
    }
    return 'mock_verif_${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  Future<UserProfile> verifyOtp({
    required String verificationId,
    required String phoneNumber,
    required String otpCode,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
    if (!Validators.isValidOtp(otpCode)) {
      throw const ValidationException(
        messageEn: 'OTP must be 6 digits.',
        messageUr: 'او ٹی پی 6 ہندسوں کا ہونا چاہیے۔',
      );
    }

    final normalized = Validators.normalizePakistaniPhone(phoneNumber);
    await _secureStorage.write(key: _tokenKey, value: 'mock_jwt_$normalized');
    await _secureStorage.write(key: _phoneKey, value: normalized);
    await _secureStorage.write(key: _nameKey, value: 'Ayesha Khan');
    await _appStorage.setGuestMode(false);

    return UserProfile(
      uid: 'user_mock_1',
      name: 'Ayesha Khan',
      phone: normalized,
      walletBalance: 2500,
    );
  }

  @override
  Future<UserProfile> signInWithGoogle() async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
    await _secureStorage.write(key: _tokenKey, value: 'mock_google_jwt');
    await _secureStorage.write(key: _phoneKey, value: '+923001234567');
    await _secureStorage.write(key: _nameKey, value: 'Ayesha Khan');
    await _appStorage.setGuestMode(false);

    return const UserProfile(
      uid: 'user_mock_google',
      name: 'Ayesha Khan',
      phone: '+923001234567',
      email: 'ayesha.khan@example.com',
      walletBalance: 2500,
    );
  }

  @override
  Future<UserProfile> continueAsGuest() async {
    await _appStorage.setGuestMode(true);
    return const UserProfile(
      uid: 'guest',
      name: 'Guest',
      phone: '',
      isGuest: true,
    );
  }

  @override
  Future<UserProfile?> getCurrentUser() async {
    final isGuest = await _appStorage.isGuestMode();
    if (isGuest) {
      return const UserProfile(
        uid: 'guest',
        name: 'Guest',
        phone: '',
        isGuest: true,
      );
    }

    final token = await _secureStorage.read(key: _tokenKey);
    if (token == null || token.isEmpty) return null;

    final phone = await _secureStorage.read(key: _phoneKey) ?? '+923001234567';
    final name = await _secureStorage.read(key: _nameKey) ?? 'Ayesha Khan';
    return UserProfile(
      uid: 'user_mock_1',
      name: name,
      phone: phone,
      walletBalance: 2500,
    );
  }

  @override
  Future<void> signOut() async {
    await _secureStorage.delete(key: _tokenKey);
    await _secureStorage.delete(key: _phoneKey);
    await _secureStorage.delete(key: _nameKey);
    await _appStorage.setGuestMode(false);
  }
}
