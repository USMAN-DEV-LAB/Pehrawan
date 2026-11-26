import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';

@immutable
class WishlistState {
  const WishlistState({
    required this.ids,
    required this.priceDropAlertIds,
    required this.products,
  });

  final Set<String> ids;
  final Set<String> priceDropAlertIds;
  final List<Product> products;

  WishlistState copyWith({
    Set<String>? ids,
    Set<String>? priceDropAlertIds,
    List<Product>? products,
  }) {
    return WishlistState(
      ids: ids ?? this.ids,
      priceDropAlertIds: priceDropAlertIds ?? this.priceDropAlertIds,
      products: products ?? this.products,
    );
  }
}

class WishlistController extends AsyncNotifier<WishlistState> {
  @override
  Future<WishlistState> build() async {
    final storage = ref.read(appStorageProvider);
    Set<String> ids;
    Set<String> alerts;
    try {
      ids = await storage.getWishlistIds();
      alerts = await storage.getPriceDropAlertIds();
    } catch (_) {
      ids = {'prod_1', 'prod_16'};
      alerts = {};
    }
    final products = await _resolveProducts(ids);
    return WishlistState(
      ids: ids,
      priceDropAlertIds: alerts,
      products: products,
    );
  }

  Future<List<Product>> _resolveProducts(Set<String> ids) async {
    final repo = ref.read(catalogRepositoryProvider);
    final list = <Product>[];
    for (final id in ids) {
      try {
        list.add(await repo.getProductById(id));
      } catch (_) {
        // Skip missing products
      }
    }
    return list;
  }

  Future<void> toggleProduct(String productId) async {
    final current =
        state.valueOrNull ??
        const WishlistState(ids: {}, priceDropAlertIds: {}, products: []);
    final nextIds = Set<String>.from(current.ids);
    final nextAlerts = Set<String>.from(current.priceDropAlertIds);
    if (nextIds.contains(productId)) {
      nextIds.remove(productId);
      nextAlerts.remove(productId);
    } else {
      nextIds.add(productId);
    }

    try {
      await ref.read(appStorageProvider).saveWishlistIds(nextIds);
      await ref.read(appStorageProvider).savePriceDropAlertIds(nextAlerts);
    } catch (_) {}

    final products = await _resolveProducts(nextIds);
    state = AsyncData(
      WishlistState(
        ids: nextIds,
        priceDropAlertIds: nextAlerts,
        products: products,
      ),
    );
  }

  Future<void> togglePriceDropAlert(String productId, bool enabled) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final nextAlerts = Set<String>.from(current.priceDropAlertIds);
    if (enabled) {
      nextAlerts.add(productId);
    } else {
      nextAlerts.remove(productId);
    }
    try {
      await ref.read(appStorageProvider).savePriceDropAlertIds(nextAlerts);
    } catch (_) {}

    state = AsyncData(current.copyWith(priceDropAlertIds: nextAlerts));
  }
}

final wishlistControllerProvider =
    AsyncNotifierProvider<WishlistController, WishlistState>(
      WishlistController.new,
    );
