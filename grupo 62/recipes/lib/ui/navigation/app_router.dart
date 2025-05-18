import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/ui/auth/auth_validator_screen.dart';
import 'package:recipes/ui/auth/login/login_screen.dart';
import 'package:recipes/ui/home/home_screen.dart';
import 'package:recipes/ui/recipe_detail/recipe_detail_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/auth',
  routes: [
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'recipeDetail/:id',
          name: 'recipeDetail',
          builder: (BuildContext context, GoRouterState state) {
            final recipeId = state.pathParameters["id"] ?? '';
            return RecipeDetailScreen(id: recipeId);
          },
        )
      ],
    ),
    GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthValidorScreen(),
        routes: [
          GoRoute(
            path: 'login',
            builder: (context, state) => const LoginScreen(),
          )
        ])
  ],
);
