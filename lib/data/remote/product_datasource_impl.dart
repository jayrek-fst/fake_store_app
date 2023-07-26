import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../util/constant_util.dart';
import '../model/product_model.dart';
import 'product_datasource.dart';

class ProductDataSourceImpl implements ProductDataSource {
  final http.Client client;

  ProductDataSourceImpl({required this.client});

  //Get all products
  @override
  Future<List<ProductModel>> getProductList() async {
    try {
      var response =
          await client.get(Uri.parse('${ConstantUtil.baseUrl}products'));
      final responseBody = jsonDecode(response.body);
      List<ProductModel> products = (responseBody as List)
          .map(
            (product) => ProductModel.fromJson(product),
          )
          .toList();
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }

  //Get a single product
  @override
  Future<ProductModel> getProductById(String productId) async {
    try {
      var response = await client
          .get(Uri.parse('${ConstantUtil.baseUrl}products/$productId'));
      final responseBody = jsonDecode(response.body);
      final product = ProductModel.fromJson(responseBody);
      return product;
    } catch (e) {
      throw Exception(e);
    }
  }

  //Get products in a specific category
  @override
  Future<List<ProductModel>> getProductsCategoryByName(
      String categoryName) async {
    try {
      var response = await client.get(
          Uri.parse('${ConstantUtil.baseUrl}products/category/$categoryName'));
      final responseBody = jsonDecode(response.body);
      List<ProductModel> categories = (responseBody as List)
          .map(
            (product) => ProductModel.fromJson(product),
          )
          .toList();
      return categories;
    } catch (e) {
      throw Exception(e);
    }
  }
}
