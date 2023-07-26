import 'package:fake_store_app/presentation/bloc/category/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../data/remote/product_datasource_impl.dart';
import '../../../data/repository/product_repository_impl.dart';
import '../../../domain/usecase/product_use_case.dart';
import '../widget/product_card_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({required this.categoryName, super.key});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(
        productUseCase: ProductUseCase(
          productRepository: ProductRepositoryImpl(
            productDataSource:
                RepositoryProvider.of<ProductDataSourceImpl>(context),
          ),
        ),
      )..add(CategoryFetched(categoryName: categoryName)),
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CategoryLoadSuccess) {
            final categories = state.categories;
            return StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              crossAxisCount: 2,
              itemCount: categories.length,
              itemBuilder: (context, index) => Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: ProductCardWidget(
                  productEntity: categories[index],
                ),
              ),
            );
          }
          if (state is CategoryLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
