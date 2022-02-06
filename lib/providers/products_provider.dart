import 'package:admin_app/http/custom_http_request.dart';
import 'package:admin_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> productList = [];


  getProducts() async {
    productList = await CustomHttpRequest().fetchProductData();
    notifyListeners();
  }
}
