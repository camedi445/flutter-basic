mixin DiscountMixin {

  double _discount = 0.0;

  double get discount => _discount;

  void setDiscount(double discount) {
    _discount = discount;
  }

  double calculateDiscountedPrice(double price) {
    return price - ((price * _discount) / 100);
  }
  
}
