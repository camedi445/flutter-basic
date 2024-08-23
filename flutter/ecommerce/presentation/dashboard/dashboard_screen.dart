import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/dashboard/widgets/product_category_title.dart';
import 'package:flutter_application_2/presentation/dashboard/widgets/product_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          height: 350,
          child: Column(
            children: [
              ProductCategoryTitle(
                categoryActionText: 'Ver todos',
                categoryTitle: 'Populares',
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  ProductItem(
                    title: 'Pan 500gr',
                    price: '7.500\$',
                    image:
                        'https://images.pexels.com/photos/209206/pexels-photo-209206.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                  ProductItem(
                    title: 'Aceite de Oliva',
                    price: '27.500\$',
                    image:
                        'https://images.pexels.com/photos/33783/olive-oil-salad-dressing-cooking-olive.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                   ProductItem(
                    title: 'Aceite de Oliva',
                    price: '27.500\$',
                    image:
                        'https://images.pexels.com/photos/33783/olive-oil-salad-dressing-cooking-olive.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
