import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kokanko/constans/colors.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.kBackground,
      body: Stack(
        fit: StackFit.expand,
        children: [_buildTopLeftBlur(), _buildBottomRightBlur()],
      ),
    );
  }
}

Widget _buildTopLeftBlur() {
  return Positioned(
    left: -208.w,
    top: -120.w,
    child: Container(
      width: 400.w,
      height: 400.w,
      decoration: ShapeDecoration(
        shape: const OvalBorder(),
        color: Colors.transparent,
        shadows: [BoxShadow(color: AppConst.kPrimaryLight, blurRadius: 120)],
      ),
    ),
  );
}

Widget _buildBottomRightBlur() {
  return Positioned(
    bottom: -120.w,
    right: -240.w,
    child: Container(
      width: 480.w,
      height: 480.w,
      decoration: ShapeDecoration(
        shape: const OvalBorder(),
        color: Colors.transparent,
        shadows: [BoxShadow(color: AppConst.kSecondaryLight, blurRadius: 100)],
      ),
    ),
  );
}
