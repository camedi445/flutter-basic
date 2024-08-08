void main() {
  // Definición de una lista de productos
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Arepas',
      'price': 100.0,
      'discountPercentage': 20.0,
      'ivaPercentage': 15.0
    },
    {
      'name': 'Huevos',
      'price': 150.0,
      'discountPercentage': 10.0,
      'ivaPercentage': 18.0
    },
    {
      'name': 'Quesito',
      'price': 200.0,
      'discountPercentage': 50.0,
      'ivaPercentage': 5.0
    },
    {
      'name': 'Cafe',
      'price': 300.0,
      'discountPercentage': 25.0,
      'ivaPercentage': 12.0
    }
  ];

  // Calcular el precio final para cada producto y almacenarlo en una nueva lista como final
  final List<Map<String, dynamic>> finalProducts = products.map((product) {
    final double finalPrice = calculateFinalPrice(
      product['price'],
      product['discountPercentage'],
      product['ivaPercentage']
    );
    return {
      'name': product['name'],
      'originalPrice': product['price'],
      'discountPercentage': product['discountPercentage'],
      'ivaPercentage': product['ivaPercentage'],
      'finalPrice': finalPrice
    };
  }).toList();

  // Imprimir los resultados
  for (final product in finalProducts) {
    print('''
      Nombre del producto: ${product['name']}
      Precio original: \$${product['originalPrice']}
      Porcentaje de descuento: ${product['discountPercentage']}%
      Porcentaje de IVA: ${product['ivaPercentage']}%
      Precio final después del descuento + IVA: \$${product['finalPrice']}
      ---
      ''');
  }
}

double calculateFinalPrice(double originalPrice, double discountPercentage, double ivaPercentage) {
  // Asegurarse de que el porcentaje de descuento y el IVA estén entre 0 y 100
  if (discountPercentage < 0 || discountPercentage > 100) {
    throw ArgumentError('El porcentaje de descuento debe estar entre 0 y 100.');
  }
  
  if (ivaPercentage < 0 || ivaPercentage > 100) {
    throw ArgumentError('El porcentaje de IVA debe estar entre 0 y 100.');
  }
  
  // Calcular el monto del descuento
  final double discountAmount = (discountPercentage / 100) * originalPrice;
  
  // Calcular el precio después del descuento
  final double discountedPrice = originalPrice - discountAmount;
  
  // Calcular el monto del IVA
  final double ivaAmount = (ivaPercentage / 100) * discountedPrice;
  
  // Calcular el precio final después del descuento y el IVA
  final double finalPrice = discountedPrice + ivaAmount;
  
  return finalPrice;
}