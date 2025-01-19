import 'package:flutter/material.dart';

class CustomTexfield extends StatelessWidget {
  const CustomTexfield({
    super.key,
    required this.txt,
    required this.fontSize,
    required this.mxLines,
    required this.fontWeight,
  });
  final String txt;
  final int mxLines;
  final double fontSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      ),
      maxLines: mxLines,
      textAlign: TextAlign.center,
    );
  }
}
