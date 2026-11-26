import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/features/design_system/presentation/screens/design_system_showcase_screen.dart';

abstract final class AppRoutes {
  static const String home = '/';
  static const String designSystem = '/design-system';
  static const String login = '/login';
}

final routerProvider = Provider<GoRouter>((ref) {
  final isAuth = ref.watch(isAuthenticatedProvider);
  final isGuest = ref.watch(isGuestProvider);

  return GoRouter(
    initialLocation: kDebugMode ? AppRoutes.designSystem : AppRoutes.home,
    redirect: (context, state) {
      final path = state.uri.path;
      // Always allow debug design-system showcase
      if (kDebugMode && path == AppRoutes.designSystem) {
        return null;
      }
      // Protected routes (checkout, orders, profile) will guard when added in Phases 2-6
      final isProtected =
          path.startsWith('/checkout') ||
          path.startsWith('/orders') ||
          path.startsWith('/profile');
      if (isProtected && !isAuth && !isGuest) {
        return AppRoutes.login;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const DesignSystemShowcaseScreen(),
      ),
      if (kDebugMode)
        GoRoute(
          path: AppRoutes.designSystem,
          builder: (context, state) => const DesignSystemShowcaseScreen(),
        ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('Login — Phase 2'))),
      ),
    ],
  );
});
