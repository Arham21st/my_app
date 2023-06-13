import 'package:flutter/material.dart';
import 'package:my_app/Widgets/big_Text.dart';
import 'package:my_app/Widgets/expandable_text.dart';
import 'package:my_app/Widgets/product_page_icon.dart';
import 'package:my_app/colors.dart';
import 'package:my_app/dimensions.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              productPageIcon(icon: Icons.clear),
              productPageIcon(icon: Icons.shopping_cart_outlined)
            ]),

            bottom: PreferredSize(
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.width10,bottom: Dimensions.width5),
                child: Center(child:BigText(text: "Recommended Products",size: Dimensions.font26,)),
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
                  child: expandableText( text: "As an alternative to all those dimensions defined in dimensions.dart, I created this function: scaledHeight(double height) => screenHeight / originalScreenHeight / height, where screenHeight comes from the GetX context, originalScreenHeight is the height of the screen you are designing on (in this case, 844 for the iPhone 12 Pro), and height is the height passed in. So anywhere you need to scale your heigh, just use scaledHeight([height-value])As an alternative to all those dimensions defined in dimensions.dart, I created this function: scaledHeight(double height) => screenHeight / originalScreenHeight / height, where screenHeight comes from the GetX context, originalScreenHeight is the height of the screen you are designing on (in this case, 844 for the iPhone 12 Pro), and height is the height passed in. So anywhere you need to scale your heigh, just use scaledHeight([height-value])As an alternative to all those dimensions defined in dimensions.dart, I created this function: scaledHeight(double height) => screenHeight / originalScreenHeight / height, where screenHeight comes from the GetX context, originalScreenHeight is the height of the screen you are designing on (in this case, 844 for the iPhone 12 Pro), and height is the height passed in. So anywhere you need to scale your heigh, just use scaledHeight([height-valuAs an alternative to all those dimensions defined in dimensions.dart, I created this function: scaledHeight(double height) => screenHeight / originalScreenHeight / height, where screenHeight comes from the GetX context, originalScreenHeight is the height of the screen you are designing on (in this case, 844 for the iPhone 12 Pro), and height is the height passed in. So anywhere you need to scale your heigh, just use scaledHeight([height-value])As an alternative to all those dimensions defined in dimensions.dart, I created this function: scaledHeight(double height) => screenHeight / originalScreenHeight / height, where screenHeight comes from the GetX context, originalScreenHeight is the height of the screen you are designing on (in this case, 844 for the iPhone 12 Pro), and height is the height passed in. So anywhere you need to scale your heigh, just use scaledHeight([height-value])e])"),
          ),
                
              ],
            ),
          ),
          
        ],
      ),

      bottomNavigationBar: Column(
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
              productPageIcon(
                iconSize: Dimensions.icon24,
                icon: Icons.remove,
                iconColor: Colors.white,
                backgroungColor: AppColors.mainColor,
              ),
              Container(
                child: BigText(text: "\$12.88 "+ "X "+"0",
                color: AppColors.mainBlackColor,
                size: Dimensions.font26,),
              ),
              productPageIcon(
                iconSize: Dimensions.icon24,
                icon: Icons.add,
                iconColor: Colors.white,
                backgroungColor: AppColors.mainColor,
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
      
        ],
      ),
    );
  }
}