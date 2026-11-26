import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pehrawan/core/constants/app_constants.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';

/// Currently selected department on Home & Categories.
final selectedDepartmentIdProvider = StateProvider<String>(
  (_) => 'dept_fashion',
);

/// Active departments loaded from [CatalogRepository].
final departmentsProvider = FutureProvider<List<Department>>((ref) {
  return ref.watch(catalogRepositoryProvider).getDepartments();
});

/// Active categories for a given department (or all active if null).
final categoriesByDeptProvider = FutureProvider.family<List<Category>, String?>(
  (ref, departmentId) {
    return ref
        .watch(catalogRepositoryProvider)
        .getCategories(departmentId: departmentId);
  },
);

final bannersProvider = FutureProvider<List<BannerItem>>((ref) {
  return ref.watch(catalogRepositoryProvider).getBanners();
});

final vouchersProvider = FutureProvider<List<Voucher>>((ref) {
  return ref.watch(catalogRepositoryProvider).getVouchers();
});

final flashSaleProductsProvider = FutureProvider.family<List<Product>, String>((
  ref,
  departmentId,
) {
  return ref
      .watch(catalogRepositoryProvider)
      .getProducts(departmentId: departmentId, isFlashSale: true, pageSize: 10);
});

final attributeSchemaProvider = FutureProvider.family<AttributeSchema?, String>(
  (ref, schemaId) {
    return ref.watch(catalogRepositoryProvider).getAttributeSchema(schemaId);
  },
);

/// Local wishlist product IDs for instant heart toggle feedback.
class WishlistIdsNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() => {'prod_1', 'prod_16'};

  void toggle(String productId) {
    if (state.contains(productId)) {
      state = {...state}..remove(productId);
    } else {
      state = {...state, productId};
    }
  }
}

final wishlistIdsProvider = NotifierProvider<WishlistIdsNotifier, Set<String>>(
  WishlistIdsNotifier.new,
);

/// Paginated state for Home "Just For You" grid.
@immutable
class PaginatedProductsState {
  const PaginatedProductsState({
    required this.items,
    required this.page,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  final List<Product> items;
  final int page;
  final bool hasMore;
  final bool isLoadingMore;

  PaginatedProductsState copyWith({
    List<Product>? items,
    int? page,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return PaginatedProductsState(
      items: items ?? this.items,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class JustForYouNotifier
    extends FamilyAsyncNotifier<PaginatedProductsState, String> {
  @override
  Future<PaginatedProductsState> build(String departmentId) async {
    final items = await ref
        .watch(catalogRepositoryProvider)
        .getProducts(
          departmentId: departmentId,
          page: 0,
          pageSize: AppConstants.defaultPageSize,
        );
    return PaginatedProductsState(
      items: items,
      page: 0,
      hasMore: items.length >= AppConstants.defaultPageSize,
    );
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));
    final nextPage = current.page + 1;
    try {
      final more = await ref
          .read(catalogRepositoryProvider)
          .getProducts(
            departmentId: arg,
            page: nextPage,
            pageSize: AppConstants.defaultPageSize,
          );
      state = AsyncData(
        PaginatedProductsState(
          items: [...current.items, ...more],
          page: nextPage,
          hasMore: more.length >= AppConstants.defaultPageSize,
        ),
      );
    } catch (_) {
      state = AsyncData(current.copyWith(isLoadingMore: false));
    }
  }
}

final justForYouProvider =
    AsyncNotifierProvider.family<
      JustForYouNotifier,
      PaginatedProductsState,
      String
    >(JustForYouNotifier.new);

/// Arguments for [productListingProvider].
@immutable
class ProductListingArgs {
  const ProductListingArgs({
    this.departmentId,
    this.categoryId,
    this.isFlashSale,
    this.schemaId,
  });

  final String? departmentId;
  final String? categoryId;
  final bool? isFlashSale;
  final String? schemaId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductListingArgs &&
          other.departmentId == departmentId &&
          other.categoryId == categoryId &&
          other.isFlashSale == isFlashSale &&
          other.schemaId == schemaId;

  @override
  int get hashCode =>
      Object.hash(departmentId, categoryId, isFlashSale, schemaId);
}

@immutable
class ProductListingState {
  const ProductListingState({
    required this.items,
    required this.page,
    required this.hasMore,
    this.sortBy = 'popular',
    this.filters = const {},
    this.isLoadingMore = false,
  });

  final List<Product> items;
  final int page;
  final bool hasMore;
  final String sortBy;
  final Map<String, String> filters;
  final bool isLoadingMore;

  ProductListingState copyWith({
    List<Product>? items,
    int? page,
    bool? hasMore,
    String? sortBy,
    Map<String, String>? filters,
    bool? isLoadingMore,
  }) {
    return ProductListingState(
      items: items ?? this.items,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      sortBy: sortBy ?? this.sortBy,
      filters: filters ?? this.filters,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class ProductListingNotifier
    extends FamilyAsyncNotifier<ProductListingState, ProductListingArgs> {
  @override
  Future<ProductListingState> build(ProductListingArgs args) async {
    final items = await ref
        .watch(catalogRepositoryProvider)
        .getProducts(
          departmentId: args.departmentId,
          categoryId: args.categoryId,
          isFlashSale: args.isFlashSale,
          page: 0,
          pageSize: AppConstants.defaultPageSize,
        );
    return ProductListingState(
      items: items,
      page: 0,
      hasMore: items.length >= AppConstants.defaultPageSize,
    );
  }

  Future<void> applySortAndFilters({
    String? sortBy,
    Map<String, String>? filters,
  }) async {
    final current = state.valueOrNull;
    final nextSort = sortBy ?? current?.sortBy ?? 'popular';
    final nextFilters = filters ?? current?.filters ?? const {};

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final items = await ref
          .read(catalogRepositoryProvider)
          .getProducts(
            departmentId: arg.departmentId,
            categoryId: arg.categoryId,
            isFlashSale: arg.isFlashSale,
            sortBy: nextSort,
            attributeFilters: nextFilters,
            page: 0,
            pageSize: AppConstants.defaultPageSize,
          );
      return ProductListingState(
        items: items,
        page: 0,
        hasMore: items.length >= AppConstants.defaultPageSize,
        sortBy: nextSort,
        filters: nextFilters,
      );
    });
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));
    final nextPage = current.page + 1;
    try {
      final more = await ref
          .read(catalogRepositoryProvider)
          .getProducts(
            departmentId: arg.departmentId,
            categoryId: arg.categoryId,
            isFlashSale: arg.isFlashSale,
            sortBy: current.sortBy,
            attributeFilters: current.filters,
            page: nextPage,
            pageSize: AppConstants.defaultPageSize,
          );
      state = AsyncData(
        current.copyWith(
          items: [...current.items, ...more],
          page: nextPage,
          hasMore: more.length >= AppConstants.defaultPageSize,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      state = AsyncData(current.copyWith(isLoadingMore: false));
    }
  }
}

final productListingProvider =
    AsyncNotifierProvider.family<
      ProductListingNotifier,
      ProductListingState,
      ProductListingArgs
    >(ProductListingNotifier.new);
