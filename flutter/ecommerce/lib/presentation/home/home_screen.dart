import 'package:ecommerce/presentation/shopping_cart/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/presentation/dashboard/dashboard_screen.dart';
import 'package:ecommerce/presentation/home/widgets/custom_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  final int pageIndex;

  const HomeScreen({
    super.key,
    required this.pageIndex,
  });

  final viewRoutes = const <Widget>[
    DashboardScreen(),
    ShoppingCartScreen(),
    Center(child: Text('Perfil')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: viewRoutes[pageIndex],
        bottomNavigationBar: CustomBottomBar(currentIndex: pageIndex));
  }
}
