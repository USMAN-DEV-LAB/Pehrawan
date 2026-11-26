import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pehrawan/core/l10n/l10n_ext.dart';
import 'package:pehrawan/core/router/app_router.dart';

/// Main bottom-navigation shell: Home, Categories, Offers, Cart (badge), Profile.
class MainShellScaffold extends StatelessWidget {
  const MainShellScaffold({
    super.key,
    required this.navigationShell,
    this.cartCount = 0,
  });

  final StatefulNavigationShell navigationShell;
  final int cartCount;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home_rounded),
            label: l10n.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.grid_view_outlined),
            activeIcon: const Icon(Icons.grid_view_rounded),
            label: l10n.categories,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.local_offer_outlined),
            activeIcon: const Icon(Icons.local_offer_rounded),
            label: l10n.offers,
          ),
          BottomNavigationBarItem(
            icon: Badge(
              isLabelVisible: cartCount > 0,
              label: Text('$cartCount'),
              child: const Icon(Icons.shopping_bag_outlined),
            ),
            activeIcon: Badge(
              isLabelVisible: cartCount > 0,
              label: Text('$cartCount'),
              child: const Icon(Icons.shopping_bag_rounded),
            ),
            label: l10n.cart,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline_rounded),
            activeIcon: const Icon(Icons.person_rounded),
            label: l10n.profile,
          ),
        ],
      ),
    );
  }
}

/// Temporary screen for Offers, Cart, and Profile tabs until Phases 4-6.
class PhaseTabPlaceholderScreen extends StatelessWidget {
  const PhaseTabPlaceholderScreen({
    super.key,
    required this.title,
    required this.icon,
    this.onAction,
    this.actionLabel,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onAction;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: EmptyStatePlaceholder(
        title: title,
        subtitle: l10n.comingSoonPhase,
        icon: icon,
        actionLabel: actionLabel,
        onAction: onAction,
      ),
    );
  }
}

class EmptyStatePlaceholder extends StatelessWidget {
  const EmptyStatePlaceholder({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 52, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 12),
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 16),
              FilledButton(onPressed: onAction, child: Text(actionLabel!)),
            ],
          ],
        ),
      ),
    );
  }
}

void navigateToProduct(BuildContext context, String productId) {
  context.push('${AppRoutes.productBase}/$productId');
}
