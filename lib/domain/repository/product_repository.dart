import '../entity/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProductList();

  Future<ProductEntity> getProductById(String productId);

  Future<List<ProductEntity>> getProductsCategoryByName(String categoryName);
}
