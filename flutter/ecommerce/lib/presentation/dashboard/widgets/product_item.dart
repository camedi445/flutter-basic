import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce/domain/model/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {context.go('/home/0/product/${product.id}')},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220,
              width: 190,
              child: Stack(
                children: [
                  SizedBox(
                    height: 220,
                    width: 190,
                    child: Hero(
                      tag: product.image,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          product.image,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 108,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                        color: AppColors.buttonColor,
                                        strokeWidth: 2),
                                  ),
                                ),
                              );
                            }
                            return child;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 190,
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                product.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
                width: 190,
                child: Text(
                  "\$${product.price}",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.buttonColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w900),
                ))
          ],
        ),
      ),
    );
  }
}
