import 'package:flutter_test/flutter_test.dart';
import 'package:pehrawan/core/config/remote_config_values.dart';
import 'package:pehrawan/core/utils/money_utils.dart';
import 'package:pehrawan/features/cart/domain/entities/cart_entities.dart';

void main() {
  group('MoneyUtils', () {
    test('formats integer rupees with Rs. prefix and thousands separator', () {
      expect(MoneyUtils.formatPkr(6850), 'Rs. 6,850');
      expect(MoneyUtils.formatPkr(0), 'Rs. 0');
      expect(MoneyUtils.formatPkr(-100), 'Rs. 0');
      expect(MoneyUtils.formatPkr(125000), 'Rs. 125,000');
    });

    test('computes rounded discount percentage', () {
      expect(MoneyUtils.discountPercent(basePrice: 6850, salePrice: 5490), 20);
      expect(MoneyUtils.discountPercent(basePrice: 1000, salePrice: 750), 25);
      expect(MoneyUtils.discountPercent(basePrice: 1000, salePrice: 1000), 0);
      expect(MoneyUtils.discountPercent(basePrice: 0, salePrice: 500), 0);
    });
  });

  group('CartTotals', () {
    const itemA = CartItem(
      id: '1',
      productId: 'p1',
      sellerId: 's1',
      sellerName: 'Zari & Loom',
      titleEn: 'Lawn Suit',
      titleUr: 'لان سوٹ',
      imageUrl: 'https://example.com/a.jpg',
      sku: 'SKU-1',
      selectedOptions: {'size': 'M'},
      unitPrice: 2000,
      quantity: 2,
    );

    const itemB = CartItem(
      id: '2',
      productId: 'p2',
      sellerId: 's1',
      sellerName: 'Zari & Loom',
      titleEn: 'Kurta',
      titleUr: 'کرتا',
      imageUrl: 'https://example.com/b.jpg',
      sku: 'SKU-2',
      selectedOptions: {'size': 'L'},
      unitPrice: 1500,
      quantity: 1,
    );

    test('empty cart returns all zeros', () {
      final totals = CartTotals.compute(items: const []);
      expect(totals.subtotal, 0);
      expect(totals.discount, 0);
      expect(totals.deliveryFee, 0);
      expect(totals.total, 0);
      expect(totals.itemCount, 0);
    });

    const config = RemoteConfigValues();

    test('applies delivery fee below free threshold', () {
      final totals = CartTotals.compute(items: const [itemB], config: config);
      expect(totals.subtotal, 1500);
      expect(totals.deliveryFee, config.deliveryFeeRupees);
      expect(totals.total, 1500 + config.deliveryFeeRupees);
      expect(totals.itemCount, 1);
    });

    test('waives delivery fee at or above free threshold', () {
      final totals = CartTotals.compute(
        items: const [itemA, itemB],
        config: config,
      );
      expect(totals.subtotal, 5500);
      expect(totals.deliveryFee, 0);
      expect(totals.total, 5500);
      expect(totals.itemCount, 3);
    });

    test('computes subtotal - discount + deliveryFee consistently', () {
      final totals = CartTotals.compute(
        items: const [itemA, itemB],
        discount: 1000,
        config: config,
      );
      expect(totals.subtotal, 5500);
      expect(totals.discount, 1000);
      // After discount is 4500 (< 5000 threshold), so delivery fee applies
      expect(totals.deliveryFee, config.deliveryFeeRupees);
      expect(totals.total, 4500 + config.deliveryFeeRupees);
    });

    test('clamps discount so total never goes negative', () {
      final totals = CartTotals.compute(
        items: const [itemB],
        discount: 99999,
        config: config,
      );
      expect(totals.discount, 1500);
      expect(totals.total, config.deliveryFeeRupees);
    });
  });
}
