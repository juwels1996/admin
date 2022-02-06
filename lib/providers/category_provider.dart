import 'package:admin_app/http/custom_http_request.dart';
import 'package:admin_app/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryList = [];

  getCategory( context, ) async {
    categoryList = await CustomHttpRequest().fetchCategoryData(context);
    notifyListeners();
  }

  deleteCategory(int index) {
    categoryList.removeAt(index);
    notifyListeners();
  }
}
