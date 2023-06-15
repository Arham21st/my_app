import 'package:flutter/material.dart';
import 'package:my_app/Screnes/Item_Slider.dart';
import 'package:my_app/Screnes/Products/popular_products.dart';
import 'package:my_app/Screnes/Products/recommended_products.dart';
import 'package:my_app/Screnes/home_Page.dart';
import 'package:get/get.dart';
import 'package:my_app/Widgets/nested_list.dart';
import 'package:my_app/controller/popular_product_controller.dart';
import 'package:my_app/controller/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'routes/routes_helper.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesHelper.getInitial(),
          getPages: RoutesHelper.routes,
    );
  }
}

