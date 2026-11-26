import 'package:pehrawan/core/storage/app_storage_service.dart';
import 'package:pehrawan/features/cart/domain/entities/cart_entities.dart';
import 'package:pehrawan/features/cart/domain/repositories/cart_repository.dart';

/// Hive-backed cart repository so guest and signed-in carts persist across restarts.
class MockCartRepository implements CartRepository {
  MockCartRepository(this._storage);

  final AppStorageService _storage;
  List<CartItem>? _cache;

  Future<List<CartItem>> _load() async {
    if (_cache != null) return _cache!;
    try {
      _cache = List<CartItem>.from(await _storage.getSavedCartItems());
    } catch (_) {
      _cache = [];
    }
    return _cache!;
  }

  Future<void> _persist(List<CartItem> items) async {
    _cache = items;
    try {
      await _storage.saveCartItems(items);
    } catch (_) {
      // Ignore storage errors in unit tests without Hive initialized.
    }
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    final items = await _load();
    return List.unmodifiable(items);
  }

  @override
  Future<void> addToCart(CartItem item) async {
    final items = List<CartItem>.from(await _load());
    final idx = items.indexWhere(
      (e) => e.productId == item.productId && e.sku == item.sku,
    );
    if (idx >= 0) {
      final existing = items[idx];
      final maxAllowed = existing.maxStock > 0 ? existing.maxStock : 99;
      final nextQty = (existing.quantity + item.quantity).clamp(1, maxAllowed);
      items[idx] = existing.copyWith(quantity: nextQty);
    } else {
      items.add(item);
    }
    await _persist(items);
  }

  @override
  Future<void> updateQuantity(String itemId, int quantity) async {
    final items = List<CartItem>.from(await _load());
    final idx = items.indexWhere((e) => e.id == itemId);
    if (idx < 0) return;
    if (quantity <= 0) {
      items.removeAt(idx);
    } else {
      final maxAllowed = items[idx].maxStock > 0 ? items[idx].maxStock : 99;
      items[idx] = items[idx].copyWith(quantity: quantity.clamp(1, maxAllowed));
    }
    await _persist(items);
  }

  @override
  Future<void> removeFromCart(String itemId) async {
    final items = List<CartItem>.from(await _load());
    items.removeWhere((e) => e.id == itemId);
    await _persist(items);
  }

  @override
  Future<void> clearCart() async {
    await _persist([]);
  }
}
