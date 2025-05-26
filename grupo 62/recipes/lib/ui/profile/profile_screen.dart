import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/ui/auth/provider/login_controller_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              ref.read(loginControllerProvider.notifier).logout();
            },
            child: Text(
              'Cerrar sesión',
              style: TextStyle(fontSize: 28.0),
            )),
      ),
    );
  }
}
