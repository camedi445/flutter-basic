import 'package:flutter/material.dart';

class ProductCategoryTitle extends StatelessWidget {
  final String? categoryTitle;
  final String? categoryActionText;

  const ProductCategoryTitle(
      {super.key, this.categoryTitle, this.categoryActionText});

  @override
  Widget build(BuildContext context) {
    final title = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          if (categoryTitle != null)
            Text(
              categoryTitle!,
              style: title,
            ),
          const Spacer(),
          if (categoryActionText != null)
            FilledButton(
              onPressed: () {},
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              child: Text(categoryActionText!),
            )
        ],
      ),
    );
  }
}
