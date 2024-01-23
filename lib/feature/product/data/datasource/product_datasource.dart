import 'package:graphql/client.dart';

// Intefaz
abstract class ProductDataSource {
  Future<QueryResult> getCategories({required String query});
  Future<QueryResult> insertCategory({required String query});
}

// Implementacion
class ProductDataSourceImpl extends ProductDataSource {
  final GraphQLClient graphQLClient;

  ProductDataSourceImpl({required this.graphQLClient});

  @override
  Future<QueryResult<Object?>> getCategories({required String query}) async {
    final options = QueryOptions(
      document: gql(query),
    );

    final result = await graphQLClient.query(options);

    return result;
  }

  @override
  Future<QueryResult<Object?>> insertCategory({required String query}) async {
    final options = QueryOptions(
      document: gql(query),
    );

    final result = await graphQLClient.query(options);

    return result;
  }


}
