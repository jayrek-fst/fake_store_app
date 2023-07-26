import '../model/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProductList();

  Future<ProductModel> getProductById(String productId);

  Future<List<ProductModel>> getProductsCategoryByName(String categoryName);
}
