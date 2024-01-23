import 'package:catalogo_productos/feature/product/data/datasource/product_datasource.dart';
import 'package:catalogo_productos/feature/product/data/repository/product_repository_impl.dart';
import 'package:catalogo_productos/feature/product/domain/repository/product_repository.dart';
import 'package:catalogo_productos/feature/product/domain/usescases/get_categories.dart';
import 'package:catalogo_productos/feature/product/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> initProductInjector() async {
  getIt.registerLazySingleton<ProductDataSource>(
    () => ProductDataSourceImpl(
      graphQLClient: getIt(),
    ),
  );

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      productDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton(() => GetCategories(productRepository: getIt()));

  getIt.registerFactory(
    () => ProductBloc(
      getCategories: getIt(),
    ),
  );
}
