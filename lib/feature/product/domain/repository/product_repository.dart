import 'package:graphql/client.dart';

abstract class ProductRepository {
  Future<QueryResult> getCategories({required String query});
}