import 'package:pehrawan/features/catalog/data/datasources/mock_seed_data.dart';
import 'package:pehrawan/features/orders/domain/entities/order_entities.dart';
import 'package:pehrawan/features/orders/domain/repositories/order_repository.dart';

class MockOrderRepository implements OrderRepository {
  final List<Order> _orders = List.of(MockSeedData.sampleOrders);

  @override
  Future<List<Order>> getOrders() async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    return List.unmodifiable(_orders);
  }

  @override
  Future<Order> getOrderById(String orderId) async {
    await Future<void>.delayed(const Duration(milliseconds: 80));
    return _orders.firstWhere((o) => o.id == orderId);
  }

  @override
  Future<Order> placeOrder(Order order) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _orders.insert(0, order);
    return order;
  }

  @override
  Future<void> requestReturn(String orderId, String reason) async {
    final idx = _orders.indexWhere((o) => o.id == orderId);
    if (idx >= 0) {
      _orders[idx] = _orders[idx].copyWith(status: OrderStatus.returnRequested);
    }
  }
}
