import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kokanko/common/widgets/background_widget.dart';
import 'package:kokanko/constans/colors.dart';
import 'package:kokanko/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder:
          (context, child) => MaterialApp.router(
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
            title: 'Kokanko',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.transparent,

              fontFamily: GoogleFonts.notoSansJp().fontFamily,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppConst.kPrimary,
                primary: AppConst.kPrimary,
                secondary: AppConst.kSecondary,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: AppConst.kWhite,
                selectedItemColor: AppConst.kTextPrimary,
                unselectedItemColor: AppConst.kTextSecondary,
                selectedLabelStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConst.kPrimary,
                  foregroundColor: AppConst.kWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
                  statusBarBrightness:
                      Brightness.light, // iOS에서 상태바 아이콘을 어둡게 (검정색)
                  statusBarIconBrightness: Brightness.dark, // 안드로이드용
                  statusBarColor: Colors.transparent, // 안드로이드 상태바 배경색
                ),
              ),
            ),
            builder: (context, child) {
              return Stack(
                children: [
                  const BackgroundWidget(),
                  child ?? const SizedBox.shrink(),
                ],
              );
            },
          ),
    );
  }
}
