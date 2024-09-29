class CartItem {
  final int productId;
  final String title;
  final double price;
  int quantity;

  CartItem({
    required this.productId,
    required this.title,
    required this.price,
    this.quantity = 1,
  });
}
