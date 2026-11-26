import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pehrawan/core/l10n/app_localizations.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/features/onboarding/presentation/screens/splash_screen.dart';

Future<void> _verifySplashCenteredAtWidth(
  WidgetTester tester,
  double width,
) async {
  tester.view.physicalSize = Size(width, 800);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        locale: const Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: AppTheme.light(),
        home: const SplashScreen(autoNavigate: false),
      ),
    ),
  );

  // Advance past the 600ms fade/scale-in animation
  await tester.pump(const Duration(milliseconds: 650));

  final screenCenterX = width / 2;
  final logoCenterX = tester
      .getCenter(find.byKey(const ValueKey('splash_logo')))
      .dx;
  final loaderCenterX = tester
      .getCenter(find.byKey(const ValueKey('splash_loader')))
      .dx;

  expect(
    (logoCenterX - screenCenterX).abs(),
    lessThanOrEqualTo(1.0),
    reason: 'Splash logo should be centered at width $width',
  );
  expect(
    (loaderCenterX - screenCenterX).abs(),
    lessThanOrEqualTo(1.0),
    reason: 'Splash loader should be centered at width $width',
  );
  expect(
    tester.getSize(find.byKey(const ValueKey('splash_loader'))).width,
    120,
  );
}

void main() {
  testWidgets('Splash content is centered at 320dp width', (tester) async {
    await _verifySplashCenteredAtWidth(tester, 320);
  });

  testWidgets('Splash content is centered at 360dp width', (tester) async {
    await _verifySplashCenteredAtWidth(tester, 360);
  });

  testWidgets('Splash content is centered at 412dp width', (tester) async {
    await _verifySplashCenteredAtWidth(tester, 412);
  });
}
