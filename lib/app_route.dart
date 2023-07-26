import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'presentation/ui/screen/dashboard_screen.dart';
import 'presentation/ui/screen/product_detail_screen.dart';

class AppRoute {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(routes: <RouteBase>[
    GoRoute(
        name: 'root',
        path: '/',
        builder: _rootPageRouteBuilder,
        routes: <RouteBase>[
          GoRoute(
              name: 'product',
              path: 'product/:id',
              pageBuilder: (context, state) {
                final productId = state.pathParameters['id'].toString();
                return pageBuilderAnimate(context, state,
                    child: ProductDetailScreen(productId: productId));
              }),
        ]),
  ]);

  static Widget _rootPageRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const DashboardScreen();

  static CustomTransitionPage pageBuilderAnimate(
          BuildContext context, GoRouterState state,
          {required Widget child}) =>
      CustomTransitionPage(
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child);
          });
}
