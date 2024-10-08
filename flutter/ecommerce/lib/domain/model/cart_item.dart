class CartItem {
  final int productId;
  final String title;
  final double price;
  final String image;
  final int quantity;

  CartItem({
    required this.image,
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity,
  });

  CartItem copyWith({
    int? productId,
    String? title,
    double? price,
    String? image,
    int? quantity,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
    );
  }
}
