import '../entity/product_entity.dart';
import '../repository/product_repository.dart';

class ProductUseCase {
  final ProductRepository productRepository;

  ProductUseCase({required this.productRepository});

  Future<List<ProductEntity>> getAllProducts() async {
    try {
      return await productRepository.getProductList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ProductEntity> getProductById(String productId) async {
    try {
      return await productRepository.getProductById(productId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductEntity>> getProductsCategoryByName(String categoryName) async {
    try {
      return await productRepository.getProductsCategoryByName(categoryName);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
