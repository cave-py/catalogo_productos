import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:catalogo_productos/feature/product/injector.dart' as product;

final GetIt getIt = GetIt.instance;

Future<void> setUp() async {
  // getIt.registerLazySingleton(
  //       () => ,
  // );

  getIt.registerLazySingleton(() => GraphQLCache());

  getIt.registerLazySingleton(
        () => GraphQLClient(
      link: HttpLink("http://192.168.0.4:4000",),
      cache: getIt(),
    ),
  );

  product.initProductInjector();

}
