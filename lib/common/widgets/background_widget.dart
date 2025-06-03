import 'package:flutter/material.dart';
import 'package:kokanko/common/widgets/circle_blur_widget.dart';
import 'package:kokanko/constans/colors.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppConst.kBackground,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CircleBlurWidget(
            left: -208,
            top: -120,
            blurColor: AppConst.kPrimaryLight,
            blurRadius: 120,
            size: 400,
          ),
          CircleBlurWidget(
            right: -240,
            bottom: -120,
            blurColor: AppConst.kSecondaryLight,
            blurRadius: 100,
            size: 480,
          ),
        ],
      ),
    );
  }
}
