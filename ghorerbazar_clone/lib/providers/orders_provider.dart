import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart.dart';

class OrdersNotifier extends StateNotifier<List<Order>> {
  OrdersNotifier() : super([]);

  void addOrder(Order order) {
    state = [order, ...state];
  }

  List<Order> get orders => state;
}

final ordersProvider = StateNotifierProvider<OrdersNotifier, List<Order>>((ref) {
  return OrdersNotifier();
});
