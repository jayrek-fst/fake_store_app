part of 'product_by_id_bloc.dart';

abstract class ProductByIdEvent extends Equatable {
  const ProductByIdEvent();

  @override
  List<Object?> get props => [];
}

class ProductByIdFetched extends ProductByIdEvent {
  const ProductByIdFetched({required this.productId});

  final String productId;

  @override
  List<Object?> get props => [productId];
}
