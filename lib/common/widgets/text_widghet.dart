import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.fontsize = 16.0,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
    this.lineHeight = 1,
    this.letterSpacing = 0.0,
  });
  final String text;
  final double fontsize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final double lineHeight;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize.sp,
        fontWeight: fontWeight,
        height: lineHeight,
        letterSpacing: letterSpacing.sp,
      ),
      textAlign: textAlign,
    );
  }
}
