
enum ProductType { earlyAccess, standard }

ProductType productTypeFromString(String type) {
  switch (type) {
    case 'earlyAccess':
      return ProductType.earlyAccess;
    case 'standard':
      return ProductType.standard;
    default:
      throw ArgumentError('Tipo de producto no reconocido: $type');
  }
}