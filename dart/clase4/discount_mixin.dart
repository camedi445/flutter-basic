mixin DiscountMixin {
  double _discount = 0.0;

  double get discount => _discount;

  set discount(double value) {
    if (value < 0 || discount > 100) throw 'el valor debe estar entre 0 y 100';
    _discount = value;
  }

  double calculateDiscountedPrice(double price) {
    return price - (price * discount / 100);
  }
}
