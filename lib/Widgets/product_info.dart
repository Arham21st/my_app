import 'package:flutter/material.dart';
import 'package:my_app/Widgets/small_Text.dart';

import '../colors.dart';
import '../dimensions.dart';
import 'big_Text.dart';
import 'icon_and_text.dart';

class productInfo extends StatelessWidget {
  final String text;
  const productInfo({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: text, size: Dimensions.font26,),
                            SizedBox(height: Dimensions.height10,),
                            Row(
                              children: [
                                Wrap(
                                  children: 
                                    List.generate(5, (index) {
                                      return Icon(
                                        Icons.star,
                                        size: 15, 
                                        color: AppColors.mainColor,
                                        opticalSize: Dimensions.icon24,);
                                      }
                                      ),
                                ),
                                SizedBox(width: Dimensions.width5),
                                SmallText(text: "4,5"),
                                SizedBox(width: Dimensions.width5),
                                SmallText(text: "1287 Comments")
    
                              ],
                            ),
                            SizedBox(height: Dimensions.height15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndText(
                                 icon: Icons.circle_sharp,
                                 text: "Normal",
                                 iconColor: AppColors.iconColor1),
                                 
                                 IconAndText(
                                 icon: Icons.location_on,
                                 text: "1.7km",
                                 iconColor: AppColors.mainColor),
                                 
                                 IconAndText(
                                 icon: Icons.access_time_rounded,
                                 text: "32min",
                                 iconColor: AppColors.iconColor2)
                              ],
    
                            )
                          ],
                        );
  }
}