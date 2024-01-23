import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:catalogo_productos/feature/product/domain/usescases/get_categories.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetCategories getCategories;

  ProductBloc({required this.getCategories}) : super(ProductState()) {
    on<ProductCategoriesRetrieved>((event, emit) async {
      emit(state.copyWith(status: ProductStatus.loading));

      final result = await getCategories(event.query);

      if (result.hasException) {
        emit(
          state.copyWith(
            status: ProductStatus.error,
            errorMessage: result.exception.toString(),
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ProductStatus.loaded,
            categories: result.data,
          ),
        );
      }
    });
  }
}
