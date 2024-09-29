import 'package:go_router/go_router.dart';
import 'package:ecommerce/presentation/home/home_screen.dart';
import 'package:ecommerce/presentation/product_detail/product_detail_screen.dart';

final router = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      name: 'home',
      path: '/home/:page',
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [
        GoRoute(
          path: 'product/:id',
          name: 'productDetail',
          builder: (context, state) {
            final id = int.tryParse(state.pathParameters["id"] ?? '') ?? 0;
            return DetailScreen(productId: id);
          },
        ),
      ],
    ),
    GoRoute(path: '/', redirect: (_, __) => '/home/0'),
  ],
);
