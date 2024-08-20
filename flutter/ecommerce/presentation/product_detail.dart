import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalle de producto'),
          centerTitle: true,
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
                'Café 500gr',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16.0,
              ),
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
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add_shopping_cart),
        ));
  }
}
