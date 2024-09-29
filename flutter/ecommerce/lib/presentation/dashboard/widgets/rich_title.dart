import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

class RichTitle extends StatelessWidget {
  final String title;
  final String percentage;

  const RichTitle({super.key, required this.title, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
              text: "$title\n",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: AppColors.tertiaryColor, fontSize: 36),
              children: [
                TextSpan(
                  text: "con ",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.tertiaryColor,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: percentage,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.buttonColor,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: " de descuento",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.tertiaryColor,
                      fontWeight: FontWeight.w600),
                )
              ])),
    );
  }
}
