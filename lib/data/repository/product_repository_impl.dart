import '../../domain/entity/product_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../remote/product_datasource.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl({required this.productDataSource});

  @override
  Future<List<ProductEntity>> getProductList() async {
    try {
      return await productDataSource.getProductList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<ProductEntity> getProductById(String productId) async {
    try {
      return await productDataSource.getProductById(productId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<ProductEntity>> getProductsCategoryByName(String categoryName) async{
    try {
      return await productDataSource.getProductsCategoryByName(categoryName);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
