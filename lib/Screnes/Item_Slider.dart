import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Screnes/Products/popular_products.dart';
import 'package:my_app/Widgets/big_Text.dart';
import 'package:my_app/Widgets/icon_and_text.dart';
import 'package:my_app/Widgets/product_info.dart';
import 'package:my_app/Widgets/small_Text.dart';
import 'package:my_app/colors.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/controller/popular_product_controller.dart';
import 'package:my_app/controller/recommended_product_controller.dart';
import 'package:my_app/dimensions.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:my_app/models/products_model.dart';
import 'package:my_app/routes/routes_helper.dart';

class ItemSlider extends StatefulWidget {
  const ItemSlider({super.key});

  @override
  State<ItemSlider> createState() => _ItemSliderState();
}

class _ItemSliderState extends State<ItemSlider> {
  PageController pageController = PageController(viewportFraction: 0.80);
  
  var currentPageValue = 0.0;
  double scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;
  

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    }
    );
    
  }

  @override
  void dispose(){
    pageController.dispose();
    
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded?Container(
         //color: Color.fromARGB(255, 202, 193, 230),
          height: Dimensions.pageView,
          child: Stack(
            children:[ 
              PageView.builder(
              controller: pageController,
              itemCount: popularProducts.popularProductList.length,
              itemBuilder: ( context,position ){
                  return buildPageItem(position, popularProducts.popularProductList[position]);
            } ),
            
            Align(
              alignment: Alignment.bottomCenter,
              child: DotsIndicator(
                    
                    dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
                    position: currentPageValue,
                    decorator: DotsDecorator(
                      activeColor: AppColors.mainColor,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            )
            ]
          )
        ):CircularProgressIndicator(color: AppColors.mainColor,);
        
        }),
        
        SizedBox(height: Dimensions.height25,),
       
            
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
              alignment: Alignment.centerLeft,
              //margin: EdgeInsets.only(left: Dimensions.width15),
              //child: BigText(text: "Hot Items",),
              
        ),
        Container(
                padding: EdgeInsets.only(right: Dimensions.width5),
          child: DotsIndicator(
                      
                      dotsCount: 4,
                      
                      
                      decorator: DotsDecorator(
                        spacing: EdgeInsets.all(1),
                        activeColor: AppColors.mainColor,
                        size: const Size(20,4.5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)), 
                        activeSize: const Size(20, 4.5),
                        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
        ),
        
           ],

         ),
        SizedBox(height: Dimensions.height10,),
        GetBuilder<RecommendedProductController>(builder: (RecommendedProducts){
          return RecommendedProducts.isLoaded?
          ListView.builder(
                          //padding: EdgeInsets.only(left:Dimensions.width15 ),
                         // scrollDirection: Axis.horizontal,
                         physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: RecommendedProducts.recommendedProductList.length,
                          itemBuilder: (BuildContext context, int index) {
                         
                              return GestureDetector(
                                onTap: () {
                                 Get.toNamed(RoutesHelper.getRecommendedProducts(index));
                                },
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: "Items",size: Dimensions.width25,),
                                  
                                  Container(
                                    padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                                    height: 120,
                                    decoration: BoxDecoration(
                                     // color: index.isEven?AppColors.mainBlackColor:AppColors.iconColor1
                                    ),
                                    child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                  
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: RecommendedProducts.recommendedProductList.length, // Replace with your nested list item count
                  itemBuilder: (BuildContext context, int innerIndex) {
                    return Container(
                      //padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(Dimensions.height10),
                                    color: index.isEven?AppColors.mainColor:AppColors.signColor,
                                  ),
                                  width: 100,
                                  height: Dimensions.pageViewTextContainer,
                                  margin: EdgeInsets.only(right: Dimensions.width5),
                                  
                                  child: Center(
                                    child: SmallText(text: RecommendedProducts.recommendedProductList[index].name!),
                  ),
                );
                
                  },
                ),
                                  ),
                                  SizedBox(height: Dimensions.height15,),
            
                                ],
                              )
                             ,
                              );
          },
        ):CircularProgressIndicator(color: AppColors.mainColor,);
        
        
        })
       
        
      ],
    );
  }
  Widget buildPageItem(int index, ProductModel popularProduct){
    Matrix4 matrix = new Matrix4.identity();

    if(index== currentPageValue.floor()){
        var currentScale = 1-(currentPageValue-index)*(1-scaleFactor);
        var currentTrans = height*(1-currentScale)/2;
        matrix = Matrix4.diagonal3Values(1, currentScale, 1).. setTranslationRaw(0, currentTrans, 0);
    }

    else if(index== currentPageValue.floor()+1){
        var currentScale = scaleFactor +(currentPageValue-index+1)*(1-scaleFactor);
        var currentTrans = height*(1-currentScale)/2;
        matrix = Matrix4.diagonal3Values(1, currentScale, 1);
        matrix = Matrix4.diagonal3Values(1, currentScale, 1).. setTranslationRaw(0, currentTrans, 0);
    }

    else if(index== currentPageValue.floor()-1){
        var currentScale = 1-(currentPageValue-index)*(1-scaleFactor);
        var currentTrans = height*(1-currentScale)/2;
        matrix = Matrix4.diagonal3Values(1, currentScale, 1);
        matrix = Matrix4.diagonal3Values(1, currentScale, 1).. setTranslationRaw(0, currentTrans, 0);
    }

    else{
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1).. setTranslationRaw(0, height*(1-currentScale)/2, 0);

    }



    return Transform(
      transform: matrix,
      child: Stack(
        
        children: [
           GestureDetector(
            onTap: () {
              Get.toNamed(RoutesHelper.getPopularProducts(index));
            },
            child: Container(
        height: Dimensions.pageViewContainer,
        margin: EdgeInsets.only(
          left: Dimensions.width10,
          right: Dimensions.width10,
          //top: Dimensions.height5
          ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          color: index.isEven?AppColors.mainBlackColor: AppColors.titleColor,
          //image: DecorationImage(image: NetworkImage(AppConstants.baseUrl+"/uploads"+popularProduct.img!),),
        ),
      ),
           ),
      Align(
        alignment: Alignment.bottomCenter,
           child: Container(
            width: Dimensions.pageViewTextContainerWidth,
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
              //left: Dimensions.width30,
              //right: Dimensions.width30,
              bottom: Dimensions.height35),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            color: AppColors.buttonBackgroundColor,
            boxShadow: [
              BoxShadow (
                color: Color.fromARGB(197, 228, 226, 226).withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 4,
                offset: Offset(0, 4), // changes the position of the shadow
        ),
              BoxShadow(
                color: AppColors.buttonBackgroundColor,
                offset: Offset(-4, 0)
              ),
              BoxShadow(
                color: AppColors.buttonBackgroundColor,
                offset: Offset(4, 0)
              ),
      ],
        ),
                  child: Container(
                        padding: EdgeInsets.only(
                        top: Dimensions.height15,
                        left: Dimensions.width10,
                        right: Dimensions.width10),
                        child: productInfo(text: popularProduct.name!)
           ),

      ),
          
          
      ),
      
        ],
      ),
    );
  }
}