import 'package:flutter/material.dart';
import 'package:my_app/Screnes/Item_Slider.dart';
import 'package:my_app/Screnes/Products/popular_products.dart';
import 'package:my_app/Screnes/Products/recommended_products.dart';
import 'package:my_app/Screnes/home_Page.dart';
import 'package:get/get.dart';
import 'package:my_app/Widgets/nested_list.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecommendedProducts(),
    );
  }
}

