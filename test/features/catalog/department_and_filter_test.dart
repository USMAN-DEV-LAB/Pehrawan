import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pehrawan/core/l10n/app_localizations.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/features/catalog/presentation/screens/product_listing_screen.dart';
import 'package:pehrawan/features/home/presentation/screens/home_screen.dart';

Widget _wrapApp(Widget child, {bool futureDepts = false}) {
  return ProviderScope(
    overrides: [
      futureDepartmentsEnabledProvider.overrideWith((_) => futureDepts),
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

Future<void> _pumpData(WidgetTester tester) async {
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 300));
  await tester.pump(const Duration(milliseconds: 300));
}

void main() {
  testWidgets(
    'HomeScreen switches department tab to Footwear and renders Footwear data',
    (tester) async {
      await tester.pumpWidget(_wrapApp(const HomeScreen(), futureDepts: true));
      await _pumpData(tester);

      expect(find.text('Fashion'), findsOneWidget);
      expect(find.text('Footwear'), findsOneWidget);

      await tester.tap(find.text('Footwear'));
      await _pumpData(tester);

      expect(find.text('Traditional Khussa'), findsOneWidget);
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -450));
      await _pumpData(tester);
      expect(find.text('Handcrafted Multani Khussa'), findsWidgets);
    },
  );

  testWidgets('SchemaFilterSheet renders EU sizes for Footwear', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrapApp(
        const ProductListingScreen(
          departmentId: 'dept_footwear',
          schemaId: 'schema_footwear',
          title: 'Footwear',
        ),
        futureDepts: true,
      ),
    );
    await _pumpData(tester);

    await tester.tap(find.byKey(const ValueKey('listing_filter_btn')));
    await _pumpData(tester);

    expect(find.text('EU Size'), findsOneWidget);
    expect(find.text('EU 37'), findsOneWidget);
    expect(find.text('EU 42'), findsOneWidget);
    expect(find.text('XS'), findsNothing);
  });

  testWidgets('SchemaFilterSheet renders clothing sizes for Fashion', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrapApp(
        const ProductListingScreen(
          departmentId: 'dept_fashion',
          schemaId: 'schema_clothing',
          title: 'Lawn',
        ),
      ),
    );
    await _pumpData(tester);

    await tester.tap(find.byKey(const ValueKey('listing_filter_btn')));
    await _pumpData(tester);

    expect(find.text('Select Size'), findsOneWidget);
    expect(find.text('XS'), findsOneWidget);
    expect(find.text('XL'), findsOneWidget);
    expect(find.text('EU 37'), findsNothing);
  });
}
