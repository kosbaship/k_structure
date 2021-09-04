import 'package:flutter/material.dart';

import 'app_colors.dart';

class CustomText extends StatelessWidget {
  final String title;
  final String fontFamily;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  CustomText({
    @required this.title,
    this.fontFamily = 'SourceSansPro',
    this.fontSize = 20.0,
    this.color = kColorShade900,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: TextStyle(
            fontSize: fontSize,
            letterSpacing: 1.5,
            color: color,
            fontFamily: fontFamily,
            fontWeight: fontWeight),
      );
}
