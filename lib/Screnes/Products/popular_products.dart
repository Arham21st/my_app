import 'package:flutter/material.dart';
import 'package:my_app/Widgets/expandable_text.dart';
import 'package:my_app/Widgets/product_info.dart';
import 'package:my_app/Widgets/product_page_icon.dart';
import 'package:my_app/dimensions.dart';

import '../../Widgets/big_Text.dart';
import '../../Widgets/icon_and_text.dart';
import '../../Widgets/small_Text.dart';
import '../../colors.dart';

class popularProducts extends StatelessWidget {
  const popularProducts({super.key});

  @override
  Widget build(BuildContext context) {
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
                image: DecorationImage(image: AssetImage("assets/img2.jpg"),fit: BoxFit.cover)
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
              productPageIcon(icon: Icons.arrow_back_ios),
              productPageIcon(icon: Icons.shopping_cart_outlined)
            ],
          )
          ),

          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularProductImgSize-30,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius25),topRight: Radius.circular(Dimensions.radius25),
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productInfo(text: "Aeroplane",) ,
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduction"),
                  SizedBox(height: Dimensions.height10,),
                  Expanded(
                    flex: 0,
                    child: SingleChildScrollView(
                      child: expandableText(text: "Awesome.. I am a iOS developer and wanted to get into flutter. I have followed so may tutorial for UI in flutter but never grasped it properly. This is by far the best UI tutorial I have seen and understood the concept. Thanks a lot for this amazing guide. I would definitely contribute in Paypal (you totally deserve it) and also would purchase the paid courses in future",
                      ),
                    ))
                ],
              ) 
            ),
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
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width5,),
                  BigText(text: " 0 "),
                  SizedBox(width: Dimensions.width5,),
                  Icon(Icons.add, color: AppColors.signColor,)
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20,
              left: Dimensions.width10, right: Dimensions.width10
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.height20),
                color: AppColors.mainColor
              ),
              child: Row(
                children: [
                  BigText(text: "\$0.08 | Add to cart "),
                  //SizedBox(width: Dimensions.width5,),
                ],
              ),
            ),

          ],

        ),
      ),
      
    );
  }
}