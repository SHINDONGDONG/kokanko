import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleBlurWidget extends StatelessWidget {
  const CircleBlurWidget({
    super.key,
    required this.blurColor,
    required this.size,
    required this.blurRadius,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  final Color blurColor;
  final int size;
  final double blurRadius;
  final int? top;
  final int? bottom;
  final int? left;
  final int? right;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left?.w,
      top: top?.w,
      right: right?.w,
      bottom: bottom?.w,
      child: Container(
        width: size.w,
        height: size.w,
        decoration: ShapeDecoration(
          shape: const OvalBorder(),
          color: Colors.transparent,
          shadows: [BoxShadow(color: blurColor, blurRadius: blurRadius)],
        ),
      ),
    );
  }
}
