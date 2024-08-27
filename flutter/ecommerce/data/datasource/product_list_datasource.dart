import 'package:myapp/domain/model/product.dart';

List<Product> getProducts() {
  return [
    Product(
        id: "1",
        name: 'Pan 500gr',
        imageUrl:
            'https://images.pexels.com/photos/209207/pexels-photo-209206.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        price: 10.0),
    Product(
        id: "2",
        name: 'Aceite de oliva',
        imageUrl:
            'https://images.pexels.com/photos/1022385/pexels-photo-1022385.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        price: 20.0),
    Product(
        id: "3",
        name: 'Arroz 500gr',
        imageUrl:
            'https://images.pexels.com/photos/1306548/pexels-photo-1306548.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        price: 30.0),
    Product(
        id: "4",
        name: 'Carne 500gr',
        imageUrl:
            'https://images.pexels.com/photos/65175/pexels-photo-65175.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        price: 40.0),
    Product(
        id: "5",
        name: 'Alitas de pollo x4',
        imageUrl:
            'https://images.pexels.com/photos/2338407/pexels-photo-2338407.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        price: 50.0),
    Product(
        id: "6",
        name: 'Café 500gr',
        imageUrl:
            'https://images.pexels.com/photos/4820813/pexels-photo-4820813.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        price: 60.0),
    Product(
        id: "7",
        name: 'Leche 1lt',
        imageUrl:
            'https://images.pexels.com/photos/248412/pexels-photo-248412.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        price: 70.0),
    Product(
        id: "8",
        name: 'Naranjas x12',
        imageUrl:
            'https://images.pexels.com/photos/327098/pexels-photo-327098.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        price: 80.0),
    Product(
        id: "9",
        name: 'Coca cola 330cm',
        imageUrl:
            'https://images.pexels.com/photos/50593/coca-cola-cold-drink-soft-drink-coke-50593.jpeg?auto=compress&cs=tinysrgb&w=600',
        price: 90.0),
    Product(
        id: "10",
        name: 'Galletas x12',
        imageUrl:
            'https://images.pexels.com/photos/6119145/pexels-photo-6119145.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        price: 100.0),
  ];
}
