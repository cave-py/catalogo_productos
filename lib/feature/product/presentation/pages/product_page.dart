import 'package:catalogo_productos/config/dependency_injection/dependency_injection.dart';
import 'package:catalogo_productos/feature/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  String? query = r'''query Categorias {
  categorias {
    id
    nombre
    fechaInsercion
  }
}''';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<ProductBloc>()
          ..add(ProductCategoriesRetrieved(query: query!)),
        child: BlocListener<ProductBloc, ProductState>(
            listener: (context, state) {
              if (state.status == ProductStatus.loaded) {
                print('data: ${state.categories.toString()}');
              }
              if (state.status == ProductStatus.error) {
                print('data: ${state.errorMessage}');
              }
            },
            child: Scaffold(
              body: Container(
                child: _ProductListView(),
              ),
            )));
  }
}

class _ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.status == ProductStatus.initial) {
          return CircularProgressIndicator();
        }
        if (state.status == ProductStatus.error) {
          return Container();
        }

        if (state.status == ProductStatus.loading) {
          return CircularProgressIndicator();
        }

        final categories = state.categories!["categorias"] as List;
        return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final nombre = categories[index]["nombre"];
              return ListTile(
                title: Text(nombre),
              );
            });
      },
    );
  }
}
