part of 'product_by_id_bloc.dart';

abstract class ProductByIdState extends Equatable {
  const ProductByIdState();

  @override
  List<Object> get props => [];
}

class ProductByIdInitial extends ProductByIdState {}

class ProductByIdLoadInProgress extends ProductByIdState {}

class ProductByIdLoadSuccess extends ProductByIdState {
  final ProductEntity product;

  const ProductByIdLoadSuccess(this.product);

  @override
  List<Object> get props => [product];
}

class ProductByIdLoadFailure extends ProductByIdState {
  final String message;

  const ProductByIdLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
