import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kokanko/common/enum/word.dart';
import 'package:kokanko/common/widgets/text_widghet.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              Gap(40.h),
              _buildOnboardingImage(),
              Gap(40.h),
              _buildMainText(),
              Gap(16.h),
              _buildSubText(),
              Gap(40.h),
              _buildStartButton(context),
            ],
          ),
        ),
      ),
    );
  }

  //상단로고
  Widget _buildLogo() {
    return SvgPicture.asset(
      "assets/logos/logo_with_kokanko.svg",
      fit: BoxFit.cover,
      semanticsLabel: 'kokanko logo',
    );
  }

  //온보딩 이미지
  Widget _buildOnboardingImage() {
    return SvgPicture.asset(
      "assets/imgs/img_onborading.svg",
      fit: BoxFit.cover,
      semanticsLabel: 'onboarding illustration',
    );
  }

  //메인 텍스트
  Widget _buildMainText() {
    return TextWidget(
      text: Word.onboardingMainText.text(),
      fontWeight: FontWeight.bold,
    );
  }

  //서브 텍스트
  Widget _buildSubText() {
    return TextWidget(
      text: Word.onboardingSubText.text(),
      fontsize: 14,
      lineHeight: 1.5,
    );
  }

  //시작 버튼
  Widget _buildStartButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.r,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: () => _onStartButtonPressed(context),
        child: TextWidget(
          text: Word.onboardingButtonText.text(),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 시작 버튼 클릭 시 다음 화면으로 이동하는 로직
  void _onStartButtonPressed(BuildContext context) {
    context.go("/bottom"); // 홈 화면으로 이동
  }
}
