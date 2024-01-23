part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductCategoriesRetrieved extends ProductEvent {
  final String query;

  const ProductCategoriesRetrieved({required this.query});

  @override
  List<Object?> get props => [query];
}
