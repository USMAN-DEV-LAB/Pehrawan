import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/features/auth/data/repositories/mock_auth_repository.dart';
import 'package:pehrawan/features/auth/domain/repositories/auth_repository.dart';
import 'package:pehrawan/features/orders/domain/entities/order_entities.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return MockAuthRepository(
    ref.watch(secureStorageProvider),
    ref.watch(appStorageProvider),
  );
});

class AuthController extends AsyncNotifier<UserProfile?> {
  @override
  Future<UserProfile?> build() async {
    final user = await ref.read(authRepositoryProvider).getCurrentUser();
    _syncFlags(user);
    return user;
  }

  void _syncFlags(UserProfile? user) {
    ref.read(isAuthenticatedProvider.notifier).state =
        user != null && !user.isGuest;
    ref.read(isGuestProvider.notifier).state = user?.isGuest ?? false;
  }

  Future<String> sendOtp(String phoneNumber) {
    return ref.read(authRepositoryProvider).sendOtp(phoneNumber);
  }

  Future<void> verifyOtp({
    required String verificationId,
    required String phoneNumber,
    required String otpCode,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await ref
          .read(authRepositoryProvider)
          .verifyOtp(
            verificationId: verificationId,
            phoneNumber: phoneNumber,
            otpCode: otpCode,
          );
      _syncFlags(user);
      return user;
    });
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await ref.read(authRepositoryProvider).signInWithGoogle();
      _syncFlags(user);
      return user;
    });
  }

  Future<void> continueAsGuest() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await ref.read(authRepositoryProvider).continueAsGuest();
      _syncFlags(user);
      return user;
    });
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    await ref.read(authRepositoryProvider).signOut();
    _syncFlags(null);
    state = const AsyncData(null);
  }
}

final authControllerProvider =
    AsyncNotifierProvider<AuthController, UserProfile?>(AuthController.new);
