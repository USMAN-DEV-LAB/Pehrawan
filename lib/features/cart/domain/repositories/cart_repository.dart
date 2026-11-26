import 'package:pehrawan/features/cart/domain/entities/cart_entities.dart';

abstract interface class CartRepository {
  Future<List<CartItem>> getCartItems();

  Future<void> addToCart(CartItem item);

  Future<void> updateQuantity(String itemId, int quantity);

  Future<void> removeFromCart(String itemId);

  Future<void> clearCart();
}
