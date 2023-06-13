import 'package:flutter/material.dart';
import 'package:my_app/dimensions.dart';

class productPageIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroungColor;
  final double size;
  final double iconSize;

  const productPageIcon({super.key, 
  required this.icon,
  this.iconColor=const Color(0xFF756d54),
  this.backgroungColor = const Color(0xFFfcf4e4),
  this.size = 40,
  this.iconSize =16,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroungColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}