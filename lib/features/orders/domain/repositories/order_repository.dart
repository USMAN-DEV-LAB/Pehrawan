import 'package:pehrawan/features/orders/domain/entities/order_entities.dart';

abstract interface class OrderRepository {
  Future<List<Order>> getOrders();

  Future<Order> getOrderById(String orderId);

  Future<Order> placeOrder(Order order);

  Future<void> requestReturn(String orderId, String reason);
}
