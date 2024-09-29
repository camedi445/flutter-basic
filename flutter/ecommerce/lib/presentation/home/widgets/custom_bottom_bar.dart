import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
  });

  void onItemTapped(BuildContext context, int index) {
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey.shade900,
      selectedItemColor: AppColors.buttonColor,
      unselectedItemColor: AppColors.tertiaryColor.withOpacity(0.8),
      selectedFontSize: 0,
      unselectedFontSize: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outlined),
          label: 'Catalogo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
    );
  }
}
