import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pehrawan/core/l10n/app_localizations.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/core/theme/app_theme.dart';
import 'package:pehrawan/features/cart/domain/entities/cart_entities.dart';
import 'package:pehrawan/features/cart/domain/usecases/cart_merge_usecase.dart';
import 'package:pehrawan/features/cart/presentation/providers/cart_providers.dart';
import 'package:pehrawan/features/catalog/data/datasources/mock_seed_data.dart';
import 'package:pehrawan/features/catalog/data/repositories/mock_catalog_repository.dart';
import 'package:pehrawan/features/product/presentation/screens/product_detail_screen.dart';
import 'package:pehrawan/features/wishlist/presentation/providers/wishlist_providers.dart';
import 'package:pehrawan/features/wishlist/presentation/screens/wishlist_screen.dart';

Future<void> _pumpData(WidgetTester tester) async {
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 300));
  await tester.pump(const Duration(milliseconds: 300));
}

void main() {
  group('CartTotals with vouchers', () {
    final percentVoucher = MockSeedData.vouchers.first; // 10% off, min 2500
    final fixedVoucher = MockSeedData.vouchers[1]; // Rs. 500 off, min 4500

    test('computes percentage voucher discount when subtotal >= minOrder', () {
      final discount = computeVoucherDiscount(
        voucher: percentVoucher,
        subtotal: 5000,
      );
      expect(discount, 500);
    });

    test('returns 0 voucher discount when subtotal < minOrder', () {
      final discount = computeVoucherDiscount(
        voucher: fixedVoucher,
        subtotal: 3000,
      );
      expect(discount, 0);
    });

    test('CartTotals reflects fixed voucher discount accurately', () {
      const item = CartItem(
        id: '1',
        productId: 'prod_1',
        sellerId: 'seller_1',
        sellerName: 'Zari & Loom Lahore',
        titleEn: 'Lawn Suit',
        titleUr: 'لان سوٹ',
        imageUrl: '',
        sku: 'SKU-1-M-CR',
        selectedOptions: {'size': 'M'},
        unitPrice: 5000,
        quantity: 1,
        maxStock: 10,
      );
      final discount = computeVoucherDiscount(
        voucher: fixedVoucher,
        subtotal: item.lineTotal,
      );
      final totals = CartTotals.compute(
        items: const [item],
        discount: discount,
      );
      expect(totals.subtotal, 5000);
      expect(totals.discount, 500);
      // 4500 < 5000 free delivery threshold -> Rs. 200 delivery
      expect(totals.deliveryFee, 200);
      expect(totals.total, 4700);
    });
  });

  group('Guest cart merge', () {
    test('merges matching SKU quantities capped at maxStock and keeps distinct items', () {
      const guestA = CartItem(
        id: 'g1',
        productId: 'prod_1',
        sellerId: 's1',
        sellerName: 'Seller 1',
        titleEn: 'Item 1',
        titleUr: '1',
        imageUrl: '',
        sku: 'SKU-1-M',
        selectedOptions: {'size': 'M'},
        unitPrice: 3000,
        quantity: 3,
        maxStock: 5,
      );
      const guestB = CartItem(
        id: 'g2',
        productId: 'prod_2',
        sellerId: 's1',
        sellerName: 'Seller 1',
        titleEn: 'Item 2',
        titleUr: '2',
        imageUrl: '',
        sku: 'SKU-2-S',
        selectedOptions: {'size': 'S'},
        unitPrice: 2000,
        quantity: 1,
        maxStock: 8,
      );
      const accountA = CartItem(
        id: 'a1',
        productId: 'prod_1',
        sellerId: 's1',
        sellerName: 'Seller 1',
        titleEn: 'Item 1',
        titleUr: '1',
        imageUrl: '',
        sku: 'SKU-1-M',
        selectedOptions: {'size': 'M'},
        unitPrice: 3000,
        quantity: 4,
        maxStock: 5,
      );

      final merged = mergeGuestCartItems(
        guestItems: const [guestA, guestB],
        accountItems: const [accountA],
      );

      expect(merged.length, 2);
      expect(merged.first.quantity, 5); // 4 + 3 capped at maxStock 5
      expect(merged.last.productId, 'prod_2');
    });
  });

  testWidgets(
    'ProductDetailScreen blocks Add to Cart without variant choice and shows low stock',
    (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            locale: const Locale('en'),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            theme: AppTheme.light(),
            home: const ProductDetailScreen(productId: 'prod_1'),
          ),
        ),
      );
      await _pumpData(tester);

      // Tap Add to Cart without selecting size/color
      await tester.tap(find.byKey(const ValueKey('add_to_cart_btn')));
      await tester.pump();

      expect(
        find.text('Please select all required options first'),
        findsOneWidget,
      );
      expect(container.read(cartBadgeCountProvider), 0);

      // Scroll down to VariantSelector and select L + Emerald (stock = 5 -> "Only 5 left in stock")
      await tester.drag(find.byType(ListView).first, const Offset(0, -450));
      await tester.pump();
      await tester.tap(find.text('L'));
      await tester.pump();
      await tester.tap(find.byTooltip('Emerald'));
      await tester.pump();

      expect(find.text('Only 5 left in stock'), findsOneWidget);

      await tester.tap(find.byKey(const ValueKey('add_to_cart_btn')));
      await _pumpData(tester);

      expect(container.read(cartBadgeCountProvider), 1);
    },
  );

  testWidgets(
    'ProductDetailScreen renders EU sizes for Footwear when enabled',
    (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            catalogRepositoryProvider.overrideWithValue(
              MockCatalogRepository(enableFutureDepartments: true),
            ),
          ],
          child: MaterialApp(
            locale: const Locale('en'),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            theme: AppTheme.light(),
            home: const ProductDetailScreen(productId: 'prod_fw_1'),
          ),
        ),
      );
      await _pumpData(tester);

      expect(find.text('EU 38'), findsOneWidget);
      expect(find.text('EU 41'), findsOneWidget);
    },
  );

  testWidgets('WishlistScreen toggles price-drop alert', (tester) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          locale: const Locale('en'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: AppTheme.light(),
          home: const WishlistScreen(),
        ),
      ),
    );
    await _pumpData(tester);

    expect(find.text('Price-drop alert'), findsWidgets);
    await tester.tap(find.byType(Switch).first);
    await _pumpData(tester);

    final alerts = container
        .read(wishlistControllerProvider)
        .valueOrNull
        ?.priceDropAlertIds;
    expect(alerts, isNotNull);
    expect(alerts, isNotEmpty);
  });
}
