import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/product_entity.dart';
import '../../../domain/usecase/product_use_case.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ProductUseCase productUseCase;

  CategoryBloc({required this.productUseCase}) : super(CategoryInitial()) {
    on<CategoryFetched>((event, emit) async {
      emit(CategoryLoadInProgress());
      try {
        final categories =
            await productUseCase.getProductsCategoryByName(event.categoryName);
        emit(CategoryLoadSuccess(categories));
      } catch (e) {
        emit(CategoryLoadFailure(e.toString()));
      }
    });
  }
}
