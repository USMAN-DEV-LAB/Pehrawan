import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';

abstract interface class CatalogRepository {
  Future<List<Department>> getDepartments({bool includeInactive = false});

  Future<List<Category>> getCategories({
    String? departmentId,
    bool includeInactive = false,
  });

  Future<AttributeSchema?> getAttributeSchema(String schemaId);

  Future<List<BannerItem>> getBanners();

  Future<List<Voucher>> getVouchers();

  Future<List<Product>> getProducts({
    String? departmentId,
    String? categoryId,
    String? query,
    bool? isFlashSale,
    Map<String, String>? attributeFilters,
    String? sortBy,
    int page = 0,
    int pageSize = 12,
  });

  Future<Product> getProductById(String id);

  Future<List<Product>> getSimilarProducts(String productId);

  Future<Seller?> getSellerById(String sellerId);
}
