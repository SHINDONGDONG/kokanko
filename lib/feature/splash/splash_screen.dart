import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kokanko/constans/colors.dart';
import 'package:kokanko/feature/onborading/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    _timer = Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [_buildTopLeftBlur(), _buildBottomRightBlur(), _buildLogo()],
      ),
    );
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
          shadows: [
            BoxShadow(color: AppConst.kSecondaryLight, blurRadius: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: SvgPicture.asset(
        'assets/logos/splash.svg',
        semanticsLabel: 'Splash Logo',
      ),
    );
  }
}
