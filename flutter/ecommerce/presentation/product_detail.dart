import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _quantity = 0;

  void _removeItemFromCart() {
    setState(() {
      _quantity = 0;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Producto eliminado del carrito'),
      ),
    );
  }

  void _addItemToCart() {
    setState(() {
      _quantity++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Se ha agregado el producto al carrito'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalle de producto'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: _removeItemFromCart,
                icon: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.delete),
                ))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 48.0,
              ),
              Image.network(
                'https://via.placeholder.com/150',
                width: 150.0,
                height: 150.0,
              ),
              const SizedBox(
                height: 32.0,
              ),
              const Text(
                'Café 1lb',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              Text(
                '$_quantity',
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              Text('Unidad${_quantity == 1 ? '' : 'es'} de café agregadas'),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Café en grano seleccionado a mano en Antioquia',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                'Precio: \$5000',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.green),
              )
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 108, 16),
          child: FloatingActionButton(
            onPressed: _addItemToCart,
            child: const Icon(Icons.add_shopping_cart),
          ),
        ));
  }
}
