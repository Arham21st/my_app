import 'package:flutter/material.dart';
import 'package:my_app/Widgets/small_Text.dart';
import 'package:my_app/colors.dart';
import 'package:my_app/dimensions.dart';

class expandableText extends StatefulWidget {
  final String text;
  const expandableText({super.key, required this.text});

  @override
  State<expandableText> createState() => _expandableTextState();
}

class _expandableTextState extends State<expandableText> {
  late String firstHalf;
  late String secondhalf;

  bool hiddenText=true;
  double textHeight = Dimensions.textHeight;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondhalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }
    else{
      firstHalf = widget.text;
      secondhalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondhalf.isEmpty?SmallText(text: firstHalf,size: Dimensions.font16, color: AppColors.paragColor,):
      Column(
        children: [
          SmallText(height: 2, size: Dimensions.font16, color: AppColors.paragColor,text:hiddenText?(firstHalf+"..."):(firstHalf+secondhalf)),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText =! hiddenText;
              });
            },
            child: Row(
              children: [
                hiddenText? SmallText(text: "Show more", color: AppColors.mainColor,):SmallText(text: "Show less", color: AppColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down: Icons.arrow_drop_up, color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}