import 'package:pehrawan/features/orders/domain/entities/order_entities.dart';

abstract interface class AuthRepository {
  /// Sends a 6-digit OTP to [phoneNumber] and returns a verificationId.
  Future<String> sendOtp(String phoneNumber);

  /// Verifies [otpCode] for [verificationId] and returns the signed-in user.
  Future<UserProfile> verifyOtp({
    required String verificationId,
    required String phoneNumber,
    required String otpCode,
  });

  /// Signs in using Google account.
  Future<UserProfile> signInWithGoogle();

  /// Enters guest browsing mode.
  Future<UserProfile> continueAsGuest();

  /// Returns the currently persisted user if signed in, or null.
  Future<UserProfile?> getCurrentUser();

  /// Signs out and clears local auth tokens.
  Future<void> signOut();
}
