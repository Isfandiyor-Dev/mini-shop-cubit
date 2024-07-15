class Cart {
  final Map<String, Map<String, dynamic>> products;
  double totalPrice;

  Cart({
    required this.products,
    required this.totalPrice,
  });
}

class Order {
  final Map<String, Map<String, dynamic>> products;
  final double totalPrice;
  final DateTime date;

  Order({
    required this.products,
    required this.totalPrice,
    required this.date,
  });
}
