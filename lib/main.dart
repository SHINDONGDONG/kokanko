import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kokanko/common/widgets/background_widget.dart';
import 'package:kokanko/constans/colors.dart';
import 'package:kokanko/feature/onborading/screen/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kokanko',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.transparent,

              fontFamily: GoogleFonts.notoSansJp().fontFamily,
              // colorScheme: ColorScheme.fromSeed(
              //   seedColor: AppConst.kPrimary,
              //   primary: AppConst.kPrimary,
              //   secondary: AppConst.kSecondary,
              // ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConst.kPrimary,
                  foregroundColor: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),

              // appBarTheme: AppBarTheme(
              //   backgroundColor: AppConst.kBackground,
              //   elevation: 0,
              //   iconTheme: IconThemeData(color: AppConst.kPrimary),
              //   titleTextStyle: TextStyle(
              //     color: AppConst.kPrimary,
              //     fontSize: 20.sp,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
            builder: (context, child) {
              return Stack(
                children: [BackgroundWidget(), child ?? SizedBox.shrink()],
              );
            },
            home: const OnboardingScreen(),
          ),
    );
  }
}
