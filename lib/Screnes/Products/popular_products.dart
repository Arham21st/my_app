import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Screnes/Products/recommended_products.dart';
import 'package:my_app/Widgets/expandable_text.dart';
import 'package:my_app/Widgets/product_info.dart';
import 'package:my_app/Widgets/product_page_icon.dart';
import 'package:my_app/controller/cart_controller.dart';
import 'package:my_app/controller/recommended_product_controller.dart';
import 'package:my_app/dimensions.dart';
import 'package:get/get.dart';
import 'package:my_app/routes/routes_helper.dart';
import '../../Widgets/big_Text.dart';
import '../../Widgets/icon_and_text.dart';
import '../../Widgets/small_Text.dart';
import '../../colors.dart';
import '../../controller/popular_product_controller.dart';
import 'package:my_app/controller/cart_controller.dart';

class popularProducts extends StatelessWidget {
  final  int pageId;
  const popularProducts({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId] ;
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          
            Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularProductImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/img2.jpg"),
                fit: BoxFit.cover)
              ),
            )
            ),
          
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RoutesHelper.getInitial());
                },
                child: productPageIcon(icon: Icons.arrow_back_ios),
              ),
              GetBuilder<PopularProductController>(builder: (controller){
                  return Stack(
                    children: [
                      productPageIcon(icon: Icons.shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems>=1?
                      Positioned(
                        right: 0,
                        top: 0,
                        child: productPageIcon(icon: Icons.circle,
                        size: Dimensions.height20,
                        iconColor: Colors.transparent,
                        backgroungColor: AppColors.mainColor,),
                      ):
                      Container(
                        
                      ),
                       Get.find<PopularProductController>().totalItems>=1?
                      Positioned(
                        right: 2.5,
                        top: 0,
                        child: BigText(text: controller.totalItems.toString(),
                        size: Dimensions.height15,color: AppColors.mainBlackColor,)
                      ):
                      Container(
                        
                      ),

                    ],
                  );
              })
            ],
          )
          ),

          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularProductImgSize-30,
            child: 
              Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius25),topRight: Radius.circular(Dimensions.radius25),
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productInfo(text:product.name!) ,
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduction"),
                  SizedBox(height: Dimensions.height10,),
                  Expanded(
                    flex: 0,
                    child: SingleChildScrollView(
                      child: expandableText(text: product.description!,
                      ),
                    ))
                ],
              ) 
            )
            
            ),

        ],
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: Dimensions.height30,
          top: Dimensions.height30
        ),
        height: Dimensions.bottomBar,
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.height20*2),
            topRight: Radius.circular(Dimensions.height20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<PopularProductController>(builder: (popularProducts)
            {
              return Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      popularProducts.setQuantity(false);
                    },
                    child: Icon(Icons.remove, color: AppColors.signColor,)),
                  SizedBox(width: Dimensions.width5,),
                  BigText(text: popularProducts.inCartItems.toString()),
                  SizedBox(width: Dimensions.width5,),
                  GestureDetector
                  (
                    onTap: () {
                      popularProducts.setQuantity(true);
                    },
                    child: Icon(Icons.add, color: AppColors.signColor,))
                ],
              ),
            );

            }
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,
              left: Dimensions.width10, right: Dimensions.width10
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: AppColors.mainColor
              ),
              child: GetBuilder<PopularProductController>(builder: (popularProducts){
                return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      popularProducts.addItem(product);
                    },
                    child: BigText(text: "\$ ${product.price} | Add to cart ")),
                  //SizedBox(width: Dimensions.width5,),
                ],
              );
              })
            ),

          ],

        ),
      ),
      
    );
  }
}