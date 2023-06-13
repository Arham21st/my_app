// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';

// import '../colors.dart';
// import '../dimensions.dart';
// import 'big_Text.dart';

// class nestedList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         physics: AlwaysScrollableScrollPhysics(),
//         itemCount: 10, // Replace with your outer list item count
//         itemBuilder: (BuildContext context, int outerIndex) {
//           return Column(
//             children: [
//               Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              Container(
//               alignment: Alignment.centerLeft,
//               //margin: EdgeInsets.only(left: Dimensions.width15),
//               child: BigText(text: "Hot Items",),
              
//         ),
//         Container(
//                 padding: EdgeInsets.only(right: Dimensions.width5),
//           child: DotsIndicator(
                      
//                       dotsCount: 4,
                      
                      
//                       decorator: DotsDecorator(
//                         spacing: EdgeInsets.all(1),
//                         activeColor: AppColors.mainColor,
//                         size: const Size(20,4.5),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)), 
//                         activeSize: const Size(20, 4.5),
//                         activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//                   ),
//                 ),
//         ),
        
//            ],

//          ),
//               Container(
//                 padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10,bottom: Dimensions.height10),
//                 height: 150,
//                 child: ListView.builder(
//                  scrollDirection: Axis.horizontal,
                  
//                   physics: AlwaysScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: 10, // Replace with your nested list item count
//                   itemBuilder: (BuildContext context, int innerIndex) {
//                     return Container(
//                       //padding: EdgeInsets.all(15),
//                                   decoration: BoxDecoration(
//                                    borderRadius: BorderRadius.circular(Dimensions.height10),
//                                     color: AppColors.mainBlackColor,
//                                   ),
//                                   width: 100,
//                                   height: Dimensions.pageViewTextContainer,
//                                   margin: EdgeInsets.only(right: Dimensions.width5),
                                  
//                                   child: Center(
//                                     child: Text('Item ', style: TextStyle(color: Colors.white)),
//                   ),
//                 );
                
//                   },
//                 ),
//               ),
//             ],
//           );
          
//         },
//       ),
//     );
//   }
// }
