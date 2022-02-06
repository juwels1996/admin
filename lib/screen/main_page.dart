// ignore: file_names
import 'package:admin_app/screen/nav_bar/category_page.dart';
import 'package:admin_app/screen/nav_bar/home_page.dart';
import 'package:admin_app/screen/nav_bar/order_page.dart';
import 'package:admin_app/screen/nav_bar/product_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currrentIndex = 0;
  List<Widget> pages = [HomePage(), CategoryPage(), ProductPage(), OrderPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currrentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: "Category"),

          BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits), label: "products"),


          BottomNavigationBarItem(
              icon: Icon(Icons.workspaces_rounded), label: "Orders"),
        ],
      ),
    );
  }
}
