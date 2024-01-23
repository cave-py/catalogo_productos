import 'package:catalogo_productos/core/usescase/usecase.dart';
import 'package:catalogo_productos/feature/product/domain/repository/product_repository.dart';
import 'package:graphql/client.dart';

class GetCategories extends UseCase<QueryResult, String> {
  final ProductRepository productRepository;

  GetCategories({required this.productRepository});

  @override
  Future<QueryResult<Object?>> call(String params) async {
    final result = await productRepository.getCategories(query: params);

    return result;
  }
}
