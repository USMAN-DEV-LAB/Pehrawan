import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/features/cart/domain/entities/cart_entities.dart';
import 'package:pehrawan/features/cart/domain/usecases/cart_merge_usecase.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';

/// Applied promo voucher in the cart.
final appliedVoucherProvider = StateProvider<Voucher?>((_) => null);

class CartController extends AsyncNotifier<List<CartItem>> {
  @override
  Future<List<CartItem>> build() {
    return ref.watch(cartRepositoryProvider).getCartItems();
  }

  Future<void> addItem(CartItem item) async {
    await ref.read(cartRepositoryProvider).addToCart(item);
    state = AsyncData(await ref.read(cartRepositoryProvider).getCartItems());
  }

  Future<void> updateQuantity(String itemId, int quantity) async {
    await ref.read(cartRepositoryProvider).updateQuantity(itemId, quantity);
    state = AsyncData(await ref.read(cartRepositoryProvider).getCartItems());
  }

  Future<void> removeItem(String itemId) async {
    await ref.read(cartRepositoryProvider).removeFromCart(itemId);
    state = AsyncData(await ref.read(cartRepositoryProvider).getCartItems());
  }

  Future<void> clear() async {
    await ref.read(cartRepositoryProvider).clearCart();
    ref.read(appliedVoucherProvider.notifier).state = null;
    state = const AsyncData([]);
  }

  /// Merges guest cart items with account items upon login.
  Future<void> mergeOnLogin(List<CartItem> accountItems) async {
    final guestItems = state.valueOrNull ?? await future;
    final merged = mergeGuestCartItems(
      guestItems: guestItems,
      accountItems: accountItems,
    );
    await ref.read(cartRepositoryProvider).clearCart();
    for (final item in merged) {
      await ref.read(cartRepositoryProvider).addToCart(item);
    }
    state = AsyncData(merged);
  }
}

final cartControllerProvider =
    AsyncNotifierProvider<CartController, List<CartItem>>(CartController.new);

/// Single source of truth for Cart, Checkout, and Order Summary totals.
final cartTotalsProvider = Provider<CartTotals>((ref) {
  final items = ref.watch(cartControllerProvider).valueOrNull ?? const [];
  final voucher = ref.watch(appliedVoucherProvider);
  final config = ref.watch(remoteConfigProvider);

  final subtotal = items.fold<int>(0, (sum, item) => sum + item.lineTotal);
  final discount = computeVoucherDiscount(voucher: voucher, subtotal: subtotal);

  return CartTotals.compute(items: items, discount: discount, config: config);
});

/// Live cart item count for the bottom navigation badge.
final cartBadgeCountProvider = Provider<int>((ref) {
  return ref.watch(cartTotalsProvider).itemCount;
});
