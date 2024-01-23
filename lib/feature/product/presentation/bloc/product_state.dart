part of 'product_bloc.dart';

enum ProductStatus { initial, loading, loaded, error }

class ProductState extends Equatable {
  final ProductStatus status;
  final Map<String, dynamic>? categories;
  final String errorMessage;

  const ProductState({
    this.status = ProductStatus.initial,
    this.categories,
    this.errorMessage = "",
  });

  ProductState copyWith({
    ProductStatus? status,
    Map<String, dynamic>? categories,
    String? errorMessage,
  }) {
    return ProductState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, categories, errorMessage];
}
