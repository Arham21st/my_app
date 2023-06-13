
import 'package:flutter/material.dart';
import 'package:my_app/Widgets/small_Text.dart';
import 'package:my_app/dimensions.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  
  const IconAndText({super.key,
   required this.icon,
   required this.text,
   required this.iconColor});
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor,size: Dimensions.icon24,),
        SizedBox(width: 2,),
        SmallText(text: text,),
      ],
    );
  }
}