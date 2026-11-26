import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pehrawan/core/providers/app_providers.dart';
import 'package:pehrawan/features/catalog/domain/entities/catalog_entities.dart';

@immutable
class ProductDetailData {
  const ProductDetailData({
    required this.product,
    required this.schema,
    required this.seller,
    required this.similarProducts,
  });

  final Product product;
  final AttributeSchema? schema;
  final Seller? seller;
  final List<Product> similarProducts;
}

final productDetailProvider = FutureProvider.family<ProductDetailData, String>((
  ref,
  productId,
) async {
  final repo = ref.watch(catalogRepositoryProvider);
  final product = await repo.getProductById(productId);

  final categories = await repo.getCategories(includeInactive: true);
  Category? category;
  for (final c in categories) {
    if (c.id == product.categoryId) {
      category = c;
      break;
    }
  }

  final schemaId = category?.attributeSchemaId ?? 'schema_clothing';
  final schema = await repo.getAttributeSchema(schemaId);
  final seller = await repo.getSellerById(product.sellerId);
  final similar = await repo.getSimilarProducts(productId);

  return ProductDetailData(
    product: product,
    schema: schema,
    seller: seller,
    similarProducts: similar,
  );
});
