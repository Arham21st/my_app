import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/cart_controller.dart';
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
    Get.find<CartController>().getCardData();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesHelper.getSplash(),
          getPages: RoutesHelper.routes,
    );
      }
      );
    }
    );
    
  }
}

