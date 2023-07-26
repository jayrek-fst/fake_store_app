import 'package:fake_store_app/domain/usecase/product_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/remote/product_datasource_impl.dart';
import '../../../data/repository/product_repository_impl.dart';
import '../../bloc/product_by_id/product_by_id_bloc.dart';
import '../widget/star_rating_widget.dart';
import 'category_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: BlocProvider(
        create: (context) => ProductByIdBloc(
          productUseCase: ProductUseCase(
            productRepository: ProductRepositoryImpl(
              productDataSource:
                  RepositoryProvider.of<ProductDataSourceImpl>(context),
            ),
          ),
        )..add(
            ProductByIdFetched(
              productId: productId,
            ),
          ),
        child: BlocConsumer<ProductByIdBloc, ProductByIdState>(
          listener: (context, state) {
            if (state is ProductByIdLoadFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ProductByIdLoadSuccess) {
              final product = state.product;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child:Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.grey.shade200,
                        margin: const EdgeInsets.all(4),
                        child: Column(
                          children: [
                            Image.network(
                              product.image.toString(),
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    product.title.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 10),
                                  Text('price: \$${product.price}'),
                                  Text('qty: ${product.rating?.count}'),
                                  Row(
                                    children: [
                                      StarRatingWidget(
                                        rating: product.rating?.rate,
                                        color: Colors.yellow.shade900,
                                      ),
                                      Text(
                                        '${product.rating?.rate}',
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                            'Related items: (${product.category.toString().toUpperCase()})'),
                      ),
                      CategoryScreen(
                          categoryName: product.category.toString())
                    ],
                  ),
                ),
              );
            }
            if (state is ProductByIdLoadInProgress) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
