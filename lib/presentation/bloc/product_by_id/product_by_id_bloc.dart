import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/product_entity.dart';
import '../../../domain/usecase/product_use_case.dart';

part 'product_by_id_event.dart';

part 'product_by_id_state.dart';

class ProductByIdBloc extends Bloc<ProductByIdEvent, ProductByIdState> {
  final ProductUseCase productUseCase;

  ProductByIdBloc({required this.productUseCase})
      : super(ProductByIdInitial()) {
    on<ProductByIdFetched>((event, emit) async {
      emit(ProductByIdLoadInProgress());
      try {
        final product = await productUseCase.getProductById(event.productId);
        emit(ProductByIdLoadSuccess(product));
      } catch (e) {
        emit(ProductByIdLoadFailure(e.toString()));
      }
    });
  }
}
