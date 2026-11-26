import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pehrawan/core/l10n/app_localizations.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/features/auth/domain/repositories/auth_repository.dart';
import 'package:pehrawan/features/auth/presentation/providers/auth_provider.dart';
import 'package:pehrawan/features/auth/presentation/screens/login_screen.dart';
import 'package:pehrawan/features/auth/presentation/widgets/otp_pin_input.dart';
import 'package:pehrawan/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:pehrawan/features/orders/domain/entities/order_entities.dart';

class _FakeAuthRepository implements AuthRepository {
  @override
  Future<UserProfile> continueAsGuest() async =>
      const UserProfile(uid: 'guest', name: 'Guest', phone: '', isGuest: true);

  @override
  Future<UserProfile?> getCurrentUser() async => null;

  @override
  Future<String> sendOtp(String phoneNumber) async => 'verif_123';

  @override
  Future<UserProfile> signInWithGoogle() async =>
      const UserProfile(uid: 'u1', name: 'Ayesha Khan', phone: '+923001234567');

  @override
  Future<void> signOut() async {}

  @override
  Future<UserProfile> verifyOtp({
    required String verificationId,
    required String phoneNumber,
    required String otpCode,
  }) async => UserProfile(uid: 'u1', name: 'Ayesha Khan', phone: phoneNumber);
}

Widget _testApp(Widget child) {
  return ProviderScope(
    overrides: [
      authRepositoryProvider.overrideWithValue(_FakeAuthRepository()),
    ],
    child: MaterialApp(
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.light(),
      home: child,
    ),
  );
}

void main() {
  testWidgets('OtpPinInput supports paste of 6 digits', (tester) async {
    String? completed;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OtpPinInput(
            onChanged: (_) {},
            onCompleted: (code) => completed = code,
          ),
        ),
      ),
    );

    await tester.enterText(find.byKey(const ValueKey('otp_box_0')), '123456');
    await tester.pump();

    expect(completed, '123456');
  });

  testWidgets('LoginScreen validates Pakistani phone and transitions to OTP', (
    tester,
  ) async {
    await tester.pumpWidget(_testApp(const LoginScreen()));
    await tester.pumpAndSettle();

    // Submit empty -> validation message
    await tester.tap(find.text('Send OTP'));
    await tester.pump();
    expect(find.text('Please enter your mobile number'), findsOneWidget);

    // Invalid number
    await tester.enterText(find.byType(TextFormField), '0211234567');
    await tester.tap(find.text('Send OTP'));
    await tester.pump();
    expect(
      find.textContaining('valid Pakistani mobile number'),
      findsOneWidget,
    );

    // Valid Pakistani mobile number
    await tester.enterText(find.byType(TextFormField), '03001234567');
    await tester.tap(find.text('Send OTP'));
    await tester.pumpAndSettle();

    expect(find.text('OTP Verification'), findsOneWidget);
    expect(find.byKey(const ValueKey('otp_box_0')), findsOneWidget);
    expect(find.byKey(const ValueKey('otp_box_5')), findsOneWidget);
  });

  testWidgets('OnboardingScreen navigates through 3 pages', (tester) async {
    await tester.pumpWidget(_testApp(const OnboardingScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Discover Your Style'), findsOneWidget);
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.text('Great Deals Every Day'), findsOneWidget);
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.text('Cash on Delivery'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
