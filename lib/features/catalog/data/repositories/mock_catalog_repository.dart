import 'package:pehrawan/core/errors/app_exception.dart';
import 'package:pehrawan/features/catalog/data/datasources/mock_seed_data.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';
import 'package:pehrawan/features/catalog/domain/repositories/catalog_repository.dart';

/// Mock implementation of [CatalogRepository] backed by [MockSeedData].
/// Supports toggling inactive departments (Footwear, Bags, Home, Electronics)
/// at runtime to demonstrate multi-category scalability with zero UI changes.
class MockCatalogRepository implements CatalogRepository {
  MockCatalogRepository({this.enableFutureDepartments = false});

  bool enableFutureDepartments;

  bool _isDeptActive(Department d) {
    if (d.isActive) return true;
    return enableFutureDepartments &&
        (d.id == 'dept_footwear' || d.id == 'dept_bags');
  }

  bool _isCategoryActive(Category c) {
    if (c.isActive) return true;
    return enableFutureDepartments && c.departmentId == 'dept_footwear';
  }

  @override
  Future<List<Department>> getDepartments({
    bool includeInactive = false,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    final list = includeInactive
        ? MockSeedData.departments
        : MockSeedData.departments.where(_isDeptActive).toList();
    return list..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }

  @override
  Future<List<Category>> getCategories({
    String? departmentId,
    bool includeInactive = false,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    final list = MockSeedData.categories.where((c) {
      if (!includeInactive && !_isCategoryActive(c)) return false;
      if (departmentId != null && c.departmentId != departmentId) return false;
      return true;
    }).toList();
    return list..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }

  @override
  Future<AttributeSchema?> getAttributeSchema(String schemaId) async {
    await Future<void>.delayed(const Duration(milliseconds: 60));
    for (final s in MockSeedData.attributeSchemas) {
      if (s.id == schemaId) return s;
    }
    return null;
  }

  @override
  Future<List<BannerItem>> getBanners() async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    return MockSeedData.banners.where((b) => b.isActive).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }

  @override
  Future<List<Voucher>> getVouchers() async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    return MockSeedData.vouchers;
  }

  @override
  Future<List<Product>> getProducts({
    String? departmentId,
    String? categoryId,
    String? query,
    bool? isFlashSale,
    Map<String, String>? attributeFilters,
    String? sortBy,
    int page = 0,
    int pageSize = 12,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 160));
    final activeCategoryIds = MockSeedData.categories
        .where(_isCategoryActive)
        .where((c) => departmentId == null || c.departmentId == departmentId)
        .map((c) => c.id)
        .toSet();

    final results = MockSeedData.products.where((p) {
      if (!p.isActive) return false;
      if (!activeCategoryIds.contains(p.categoryId)) return false;
      if (categoryId != null && p.categoryId != categoryId) return false;
      if (isFlashSale == true && !p.isFlashSale) return false;
      if (query != null && query.trim().isNotEmpty) {
        final q = query.trim().toLowerCase();
        final matchEn = p.titleEn.toLowerCase().contains(q);
        final matchUr = p.titleUr.contains(q);
        if (!matchEn && !matchUr) return false;
      }
      if (attributeFilters != null && attributeFilters.isNotEmpty) {
        for (final entry in attributeFilters.entries) {
          final hasMatch = p.variants.any(
            (v) => v.options[entry.key] == entry.value && v.stock > 0,
          );
          if (!hasMatch) return false;
        }
      }
      return true;
    }).toList();

    switch (sortBy) {
      case 'price_asc':
        results.sort((a, b) => a.effectivePrice.compareTo(b.effectivePrice));
      case 'price_desc':
        results.sort((a, b) => b.effectivePrice.compareTo(a.effectivePrice));
      case 'rating':
        results.sort((a, b) => b.ratingAvg.compareTo(a.ratingAvg));
      case 'popular':
      default:
        results.sort((a, b) => b.soldCount.compareTo(a.soldCount));
    }

    final start = page * pageSize;
    if (start >= results.length) return const [];
    final end = (start + pageSize).clamp(0, results.length);
    return results.sublist(start, end);
  }

  @override
  Future<Product> getProductById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    for (final p in MockSeedData.products) {
      if (p.id == id) return p;
    }
    throw const NotFoundException();
  }

  @override
  Future<List<Product>> getSimilarProducts(String productId) async {
    final target = await getProductById(productId);
    return MockSeedData.products
        .where((p) => p.id != productId && p.categoryId == target.categoryId)
        .take(6)
        .toList();
  }

  @override
  Future<Seller?> getSellerById(String sellerId) async {
    for (final s in MockSeedData.sellers) {
      if (s.id == sellerId) return s;
    }
    return null;
  }
}
