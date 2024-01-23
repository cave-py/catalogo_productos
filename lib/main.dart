import 'package:catalogo_productos/config/dependency_injection/dependency_injection.dart';
import 'package:catalogo_productos/feature/product/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // routes: {
      //   '/': (context) => ProductPage(),
      // },
      home: ProductPage(),
    );
  }
}
