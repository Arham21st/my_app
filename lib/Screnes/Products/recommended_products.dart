import 'package:flutter/material.dart';
import 'package:my_app/Widgets/big_Text.dart';
import 'package:my_app/Widgets/expandable_text.dart';
import 'package:my_app/Widgets/product_page_icon.dart';
import 'package:my_app/colors.dart';
import 'package:my_app/controller/popular_product_controller.dart';
import 'package:my_app/dimensions.dart';
import 'package:get/get.dart';
import 'package:my_app/routes/routes_helper.dart';

import '../../controller/recommended_product_controller.dart';

class RecommendedProducts extends StatelessWidget {
  final int pageId;
  const RecommendedProducts({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RoutesHelper.getInitial());
                },
                child: productPageIcon(icon: Icons.clear),
              ),
              GetBuilder<PopularProductController>(builder: (controller){
                  return Stack(
                    children: [
                      productPageIcon(icon: Icons.shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems>=1?
                      Positioned(
                        right: 3,
                        top: 3,
                        child: productPageIcon(icon: Icons.circle,
                        size: Dimensions.width15,
                        iconColor: Colors.transparent,
                        backgroungColor: AppColors.mainColor,),
                      ):
                      Container(
                        
                      ),
                       Get.find<PopularProductController>().totalItems>=1?
                      Positioned(
                        right: 5,
                        top: 3,
                        child: BigText(text: controller.totalItems.toString(),
                        size: Dimensions.width15,color: AppColors.mainBlackColor,)
                      ):
                      Container(
                        
                      ),

                    ],
                  );
              })
            
            ]
            
            ),

            bottom: PreferredSize(
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.width10,bottom: Dimensions.width5),
                child: Center(child:BigText(text: product.name! ,size: Dimensions.font26,)),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius15),
                    topRight: Radius.circular(Dimensions.radius15))
                ),
              ),
               preferredSize: Size.fromHeight(Dimensions.height45)),
            pinned: true,
            backgroundColor: Color.fromARGB(197, 248, 122, 4),
            expandedHeight: Dimensions.ExpandedAppBar,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/img3.jpg",width: double.maxFinite,
              fit: BoxFit.cover,),
            
              ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                  left: Dimensions.width10,
                  top: Dimensions.height10,
                  right: Dimensions.width10,
                  bottom: Dimensions.height10),
                  child: expandableText( text:product.description! ),
          ),
                
              ],
            ),
          ),
          
        ],
      ),

      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         Container(
          padding: EdgeInsets.only(
          left: Dimensions.width30*2,
          right: Dimensions.width30*2,
          bottom: Dimensions.height15),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  controller.setQuantity(false);
                },
                child: productPageIcon(
                iconSize: Dimensions.icon24,
                icon: Icons.remove,
                iconColor: Colors.white,
                backgroungColor: AppColors.mainColor,
                )
              ),
              Container(
                child: BigText(text: "\$ ${product.price} X ${controller.inCartItems}",
                color: AppColors.mainBlackColor,
                size: Dimensions.font26,),
              ),
              GestureDetector(
                onTap: () {
                  controller.setQuantity(true);
                },
                child: productPageIcon(
                iconSize: Dimensions.icon24,
                icon: Icons.add,
                iconColor: Colors.white,
                backgroungColor: AppColors.mainColor,
                )
              )
            ],
          ),

         ),
         Container(
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
            Container(
              padding: EdgeInsets.all(Dimensions.height15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: Colors.white,
              ),
              child: productPageIcon(icon: Icons.favorite,
              iconColor: AppColors.mainColor,
              backgroungColor: Colors.transparent,
              iconSize: Dimensions.icon24,)
            ),

            GestureDetector(
              onTap: () {
                controller.addItem(product);
              },
              child: Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,
              left: Dimensions.width10, right: Dimensions.width10
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: AppColors.mainColor
              ),
              child: Row(
                children: [
                  BigText(text: "\$ ${product.price} | Add to cart "),
                  //SizedBox(width: Dimensions.width5,),
                ],
              ),
            ),
            )

          ],

        ),
      ),
      
        ],
      );

      
      })
    );
  }
}