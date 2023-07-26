part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class CategoryFetched extends CategoryEvent {
  const CategoryFetched({required this.categoryName});

  final String categoryName;

  @override
  List<Object?> get props => [categoryName];
}
