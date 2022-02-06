import 'package:admin_app/provider/order_provider.dart';
import 'package:admin_app/providers/category_provider.dart';
import 'package:admin_app/providers/products_provider.dart';
import 'package:admin_app/screen/add_category.dart';
import 'package:admin_app/screen/home_page.dart';
import 'package:admin_app/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ProductsProvider>(
          create: (_) => ProductsProvider()),

      ChangeNotifierProvider<CategoryProvider>( create: (_) => CategoryProvider()),

      ChangeNotifierProvider<OrderProvider>(
          create: (_) => OrderProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage());
  }
}
