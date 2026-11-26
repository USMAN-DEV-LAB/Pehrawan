import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/core/widgets/widgets.dart';
import 'package:pehrawan/features/catalog/data/datasources/mock_seed_data.dart';
import 'package:pehrawan/core/l10n/app_localizations.dart';

Widget _wrapWithApp(Widget child, {Locale locale = const Locale('en')}) {
  return MaterialApp(
    locale: locale,
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    theme: AppTheme.light(locale: locale),
    home: Scaffold(body: child),
  );
}

void main() {
  testWidgets('ProductCard renders title, Rs. price, and wishlist icon', (
    tester,
  ) async {
    final product = MockSeedData.products.first;
    var wishlisted = false;

    await tester.pumpWidget(
      _wrapWithApp(
        SizedBox(
          width: 200,
          child: ProductCard(
            product: product,
            isWishlisted: wishlisted,
            onWishlistTap: () => wishlisted = !wishlisted,
            onTap: () {},
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text(product.titleEn), findsOneWidget);
    expect(find.textContaining('Rs.'), findsWidgets);
    expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);
  });

  testWidgets('VariantSelector renders schema-driven EU shoe sizes', (
    tester,
  ) async {
    final shoeSchema = MockSeedData.attributeSchemas[1];
    String? pickedSize;

    await tester.pumpWidget(
      _wrapWithApp(
        VariantSelector(
          schema: shoeSchema,
          selectedOptions: const {'size': 'EU 38', 'color': 'Tan'},
          variants: const [],
          onOptionSelected: (k, v) {
            if (k == 'size') pickedSize = v;
          },
        ),
      ),
    );
    await tester.pump();

    expect(find.text('EU 37'), findsOneWidget);
    expect(find.text('EU 42'), findsOneWidget);

    await tester.tap(find.text('EU 40'));
    expect(pickedSize, 'EU 40');
  });
}
