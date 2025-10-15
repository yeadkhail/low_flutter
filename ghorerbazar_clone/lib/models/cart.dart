import 'product.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  double get totalPrice => product.price * quantity;

  CartItem copyWith({
    Product? product,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}

class Order {
  final String id;
  final String userId;
  final List<CartItem> items;
  final double total;
  final DateTime orderDate;
  final String status;
  final String shippingAddress;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.total,
    required this.orderDate,
    required this.status,
    required this.shippingAddress,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'].toString(),
      userId: json['user_id'].toString(),
      items: [], // Would need to populate from separate table
      total: (json['total'] ?? 0.0).toDouble(),
      orderDate: DateTime.parse(json['order_date']),
      status: json['status'] ?? 'pending',
      shippingAddress: json['shipping_address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'total': total,
      'order_date': orderDate.toIso8601String(),
      'status': status,
      'shipping_address': shippingAddress,
    };
  }
}
