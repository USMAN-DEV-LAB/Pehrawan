import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/core/widgets/main_shell_scaffold.dart';
import 'package:pehrawan/features/auth/presentation/providers/auth_provider.dart';
import 'package:pehrawan/features/auth/presentation/screens/login_screen.dart';
import 'package:pehrawan/features/cart/presentation/providers/cart_providers.dart';
import 'package:pehrawan/features/cart/presentation/screens/cart_screen.dart';
import 'package:pehrawan/features/catalog/presentation/screens/categories_screen.dart';
import 'package:pehrawan/features/catalog/presentation/screens/product_listing_screen.dart';
import 'package:pehrawan/features/design_system/presentation/screens/design_system_showcase_screen.dart';
import 'package:pehrawan/features/home/presentation/screens/home_screen.dart';
import 'package:pehrawan/features/onboarding/presentation/screens/language_select_screen.dart';
import 'package:pehrawan/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:pehrawan/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:pehrawan/features/product/presentation/screens/product_detail_screen.dart';
import 'package:pehrawan/features/search/presentation/screens/search_screen.dart';
import 'package:pehrawan/features/wishlist/presentation/screens/wishlist_screen.dart';

abstract final class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String language = '/language';
  static const String login = '/login';
  static const String home = '/';
  static const String categories = '/categories';
  static const String offers = '/offers';
  static const String cart = '/cart';
  static const String profile = '/profile';
  static const String search = '/search';
  static const String listing = '/listing';
  static const String productBase = '/product';
  static const String wishlist = '/wishlist';
  static const String notifications = '/notifications';
  static const String checkout = '/checkout';
  static const String designSystem = '/design-system';
}

final routerProvider = Provider<GoRouter>((ref) {
  final isAuth = ref.watch(isAuthenticatedProvider);
  final isGuest = ref.watch(isGuestProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    redirect: (context, state) {
      final path = state.uri.path;
      if (kDebugMode && path == AppRoutes.designSystem) {
        return null;
      }
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
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.language,
        builder: (context, state) => const LanguageSelectScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          final cartCount = ref.watch(cartBadgeCountProvider);
          return MainShellScaffold(
            navigationShell: navigationShell,
            cartCount: cartCount,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.categories,
                builder: (context, state) => const CategoriesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.offers,
                builder: (context, state) => ProductListingScreen(
                  isFlashSale: true,
                  title: context.l10n.offers,
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.cart,
                builder: (context, state) => const CartScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) => PhaseTabPlaceholderScreen(
                  title: context.l10n.profile,
                  icon: Icons.person_outline_rounded,
                  actionLabel: context.l10n.signOut,
                  onAction: () async {
                    await ref.read(authControllerProvider.notifier).signOut();
                    if (!context.mounted) return;
                    context.go(AppRoutes.login);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.search,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: AppRoutes.listing,
        builder: (context, state) {
          final params = state.uri.queryParameters;
          return ProductListingScreen(
            departmentId: params['departmentId'],
            categoryId: params['categoryId'],
            isFlashSale: params['flash'] == 'true',
            schemaId: params['schemaId'],
            title: params['title'],
          );
        },
      ),
      GoRoute(
        path: '${AppRoutes.productBase}/:id',
        builder: (context, state) => ProductDetailScreen(
          productId: state.pathParameters['id'] ?? 'prod_1',
        ),
      ),
      GoRoute(
        path: AppRoutes.wishlist,
        builder: (context, state) => const WishlistScreen(),
      ),
      GoRoute(
        path: AppRoutes.checkout,
        builder: (context, state) => PhaseTabPlaceholderScreen(
          title: context.l10n.proceedToCheckout,
          icon: Icons.payment_outlined,
        ),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => PhaseTabPlaceholderScreen(
          title: context.l10n.notificationsTitle,
          icon: Icons.notifications_none_rounded,
        ),
      ),
      if (kDebugMode)
        GoRoute(
          path: AppRoutes.designSystem,
          builder: (context, state) => const DesignSystemShowcaseScreen(),
        ),
    ],
  );
});
