import 'package:catalogo_productos/feature/product/data/datasource/product_datasource.dart';
import 'package:graphql/src/core/query_result.dart';

import '../../domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl({required this.productDataSource});

  @override
  Future<QueryResult<Object?>> getCategories({required String query}) async {
    final result = await productDataSource.getCategories(query: query);

    return result;
  }
}
