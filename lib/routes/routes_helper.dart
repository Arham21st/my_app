import 'package:get/get.dart';
import 'package:my_app/Screnes/Products/popular_products.dart';
import 'package:my_app/Screnes/Products/recommended_products.dart';
import 'package:my_app/Screnes/Item_Slider.dart';
import '../Screnes/home_Page.dart';

class RoutesHelper {
  static const String splash = '/splash-page';
  static const String initial = '/';
  static const String popularItems = '/popular-Items';
  static const String recommendedItems = '/recommended-Items';
  static const String cartPage = '/cart-page';

 // static String getSplash() => '$splash';
  static String getInitial() => '$initial';
  static String getPopularProducts(int pageId) => "$popularItems?pageId=$pageId";
  static String getRecommendedProducts(int pageId) =>'$recommendedItems?pageId=$pageId';
  //static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    //GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    
    // GetPage(
    //     name: recommendedProducts,
    //     page: () =>RecommendedProducts(index: index) ),
    GetPage(
      name: popularItems, page: () {
        var pageId=Get.parameters["pageId"];
        return popularProducts(pageId: int.parse(pageId!));
      }
    ),

    GetPage(
      name: recommendedItems, page: () {
        var pageId=Get.parameters["pageId"];
        return RecommendedProducts(pageId: int.parse(pageId!));
      }
    ),
    
    // GetPage(
    //     name: cartPage,
    //     page: () {
    //       return CartPage();
    //     },
    //     transition: Transition.fadeIn),
  ];
}