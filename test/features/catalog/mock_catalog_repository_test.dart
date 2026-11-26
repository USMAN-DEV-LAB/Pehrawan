import 'package:flutter_test/flutter_test.dart';
import 'package:pehrawan/features/catalog/data/repositories/mock_catalog_repository.dart';

void main() {
  group('MockCatalogRepository scalability', () {
    test('launches with only Fashion department active', () async {
      final repo = MockCatalogRepository(enableFutureDepartments: false);
      final depts = await repo.getDepartments();
      expect(depts.length, 1);
      expect(depts.first.id, 'dept_fashion');
    });

    test(
      'exposes Footwear & Bags when future departments are enabled',
      () async {
        final repo = MockCatalogRepository(enableFutureDepartments: true);
        final depts = await repo.getDepartments();
        expect(depts.any((d) => d.id == 'dept_footwear'), isTrue);
        final shoeCats = await repo.getCategories(
          departmentId: 'dept_footwear',
        );
        expect(shoeCats, isNotEmpty);
        expect(shoeCats.first.attributeSchemaId, 'schema_footwear');
      },
    );

    test('paginates 40+ seeded clothing products', () async {
      final repo = MockCatalogRepository(enableFutureDepartments: false);
      final page0 = await repo.getProducts(page: 0, pageSize: 20);
      final page1 = await repo.getProducts(page: 1, pageSize: 20);
      final page2 = await repo.getProducts(page: 2, pageSize: 20);
      expect(page0.length, 20);
      expect(page1.length, 20);
      expect(page2.length, greaterThanOrEqualTo(1));
    });
  });
}
