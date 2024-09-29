import 'package:ecommerce/presentation/dashboard/widgets/image_banner_list.dart';
import 'package:ecommerce/presentation/dashboard/widgets/rich_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/presentation/dashboard/widgets/horizontal_product_list.dart';
import 'package:ecommerce/provider/product_list_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productsProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          productsAsyncValue.when(
            data: (productList) {
              return Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const RichTitle(title: 'Fin de temporada', percentage: '25%'),
                  const ImageBannerList(),
                  const SizedBox(
                    height: 40,
                  ),
                  HorizontalProductList(
                      productList: productList.reversed.toList(),
                      title: 'Populares',
                      subtitle: 'Ver todos'),
                  HorizontalProductList(
                      productList: productList,
                      title: 'En oferta',
                      subtitle: 'Ver todos'),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          )
        ],
      ),
    );
  }
}
