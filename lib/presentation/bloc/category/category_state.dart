part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoadInProgress extends CategoryState {}

class CategoryLoadSuccess extends CategoryState {
  final List<ProductEntity> categories;

  const CategoryLoadSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoryLoadFailure extends CategoryState {
  final String message;

  const CategoryLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
