import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/presentation/product_detail/widget/product_detail_quantity.dart';
import 'package:ecommerce/provider/product_list_provider.dart';
import 'package:ecommerce/utils/colors.dart';

class DetailScreen extends ConsumerWidget {
  final int productId;
  const DetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productProvider(productId));

    return Scaffold(
        backgroundColor: Colors.black,
        body: productsAsyncValue.when(
          data: (product) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 350,
                      width: double.infinity,
                      child: Hero(
                        tag: product.image,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 12.0),
                            child: Text(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              product.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              product.isFav
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_outline_rounded,
                              color: product.isFav ? Colors.red : Colors.white,
                              size: 35,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "\$${product.price}",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.buttonColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      product.description,
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ProductDetailQuantity(product)
                  ],
                ),
              ),
            );
          },
          error: (error, stack) => Center(child: Text('Error: $error')),
          loading: () => const SizedBox(
              width: double.infinity,
              height: 400,
              child: Center(child: CircularProgressIndicator())),
        ));
  }
}
