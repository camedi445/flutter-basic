import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const ProductItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 125,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadinProgress) {
                    if (loadinProgress != null) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return child;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 150,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  title,
                  maxLines: 2,
                  style: theme.titleMedium,
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  price,
                  style: theme.titleSmall?.copyWith(color: Colors.green),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
