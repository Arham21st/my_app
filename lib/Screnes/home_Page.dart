import 'package:flutter/material.dart';
import 'package:my_app/Screnes/Item_Slider.dart';
import 'package:my_app/colors.dart';
import 'package:my_app/dimensions.dart';
import 'package:my_app/widgets/big_Text.dart';
import 'package:my_app/widgets/small_Text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // print("%d safasf",MediaQuery.of(context).size.width);
    return Scaffold(
      
      body: Column(
        children: [
          Container(

      child: Container(

            margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              children: [
              BigText(text: "Pakistan" , color: AppColors.mainColor, size: Dimensions.height25,),
              Row(
                
                children: [
                  SmallText(text: "Karachi",color: AppColors.mainBlackColor,size: Dimensions.height15,),
                  Icon(Icons.arrow_drop_down)
                ],
              )
              ],
            ),
            Center(
            child: Container(
              width: Dimensions.height45,
              height: Dimensions.height45,
              child: Icon(Icons.search, color: Colors.white, size: Dimensions.icon24,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: AppColors.mainColor,
                
              ),
            )
            )
          ],
        ),
      ),
    ),     
          Expanded(child: SingleChildScrollView(child: ItemSlider()),)
            

        ],
      )
    );
  }
}