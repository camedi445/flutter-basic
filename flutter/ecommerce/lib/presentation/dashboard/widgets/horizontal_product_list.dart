import 'package:flutter/material.dart';
import 'package:ecommerce/domain/model/product.dart';
import 'package:ecommerce/presentation/dashboard/widgets/product_item.dart';

class HorizontalProductList extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Product> productList;

  const HorizontalProductList(
      {super.key,
      required this.productList,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 320,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: productList[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
