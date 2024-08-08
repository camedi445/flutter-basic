import 'cart.dart';
import 'early_access_product.dart';
import 'product_datasource.dart';
import 'standard_product.dart';

void main() async {
  // orden clases, tipos de constructores, setters y getters, asserts, throws, abstractas
  // enumeraciones, extend and implement patron adaptador e inversion de control

  final Cart cart = Cart();

  final oil = StandardProduct(
      title: 'Aceite de oliva',
      description: '250ml de contenido',
      price: 2500.0,
      image: 'url1',
      quantity: 2);

  final Map<String, dynamic> breadRawJson = {
    'title': 'Pan',
    'description': '12 rodajas de pan fresco',
    'image': 'url2',
    'price': 90.0,
    'quantity': 1
  };

  final bread = EarlyAccessProduct.fromJson(breadRawJson);

  print(bread);
  print(oil);

  // Añadir inventario de cada producto

  oil.addStock(2);
  bread.addStock(1);

  // aplicar descuento
  bread.discount = 15.0;

  // agregar al carrito uno de cada producto

  cart.addProduct(oil);
  cart.addProduct(bread);

  // mostrar stock

  print('Stock de ${oil.title}: ${oil.stock}');
  print('Stock de ${bread.title}: ${bread.stock}');

  // intentar agregar pan sin stock

  // cart.addProduct(oil);

  // mostrar precios con descuento

  print(
      'Precio a pagar de ${bread.title}: ${bread.calculateDiscountedPrice(bread.price)}');

  // Future, async & await
  // Explicar como funciona las apps moviles en cuanto a main thread and async tasks

  // Inicializar datasource
  final datasource = ProductDatasource();

  // Llamar un api
  //print('Iniciando la solicitud de productos...');

  /* datasource
      .fetchProductList()
      .then((value) => print(value))
      .catchError((error) {
    print('Error: $error');
  }).whenComplete(() => print('Solicitud de productos finalizada')); */

  print('Iniciando la solicitud de productos...');
  final productList = await datasource.fetchProductList();

  print(productList);

  print('Solicitud de productos finalizada');

  // Streams explicar patron observer y como funciona el cold flow

  final productListStream = datasource.getProductStream();

  await for (final product in productListStream) {
    print(product);
  }

}

