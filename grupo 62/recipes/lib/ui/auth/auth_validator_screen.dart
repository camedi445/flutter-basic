import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/ui/auth/login/login_screen.dart';
import 'package:recipes/ui/auth/provider/auth_repository_provider.dart';
import 'package:recipes/ui/home/home_screen.dart';

class AuthValidorScreen extends ConsumerWidget {
  const AuthValidorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (user) {
          if (user != null) return HomeScreen();
          return const LoginScreen();
        },
        error: (_, trace) => const LoginScreen(),
        loading: () => Container());
  }
}
