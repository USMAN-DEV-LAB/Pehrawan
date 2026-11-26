import 'package:pehrawan/features/cart/domain/entities/cart_entities.dart';
import 'package:pehrawan/features/cart/domain/repositories/cart_repository.dart';

class MockCartRepository implements CartRepository {
  final List<CartItem> _items = [];

  @override
  Future<List<CartItem>> getCartItems() async {
    await Future<void>.delayed(const Duration(milliseconds: 60));
    return List.unmodifiable(_items);
  }

  @override
  Future<void> addToCart(CartItem item) async {
    final idx = _items.indexWhere(
      (e) => e.productId == item.productId && e.sku == item.sku,
    );
    if (idx >= 0) {
      final existing = _items[idx];
      _items[idx] = existing.copyWith(
        quantity: existing.quantity + item.quantity,
      );
    } else {
      _items.add(item);
    }
  }

  @override
  Future<void> updateQuantity(String itemId, int quantity) async {
    final idx = _items.indexWhere((e) => e.id == itemId);
    if (idx < 0) return;
    if (quantity <= 0) {
      _items.removeAt(idx);
    } else {
      _items[idx] = _items[idx].copyWith(quantity: quantity);
    }
  }

  @override
  Future<void> removeFromCart(String itemId) async {
    _items.removeWhere((e) => e.id == itemId);
  }

  @override
  Future<void> clearCart() async {
    _items.clear();
  }
}
