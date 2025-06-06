import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kokanko/common/enum/word.dart';
import 'package:kokanko/constans/colors.dart';
import 'package:kokanko/feature/chat/screen/chat_screen.dart';
import 'package:kokanko/feature/home/screen/home_screen.dart';
import 'package:kokanko/feature/profile/screen/profile_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ProfileScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent, // 투명 배경
          splashColor: Colors.transparent, // 클릭 시 스플래시 효과 제거
          highlightColor: Colors.transparent, // 클릭 시 하이라이트 효과 제거
        ),
        child: Container(
          color: AppConst.kWhite,
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 5.r),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
            enableFeedback: false,
            items: [
              _buildNavItem(
                "assets/logos/logo_home_outline.svg",
                "assets/logos/logo_home.svg",
                Word.bottomNavigationHome.text(),
                0,
              ),
              _buildNavItem(
                "assets/logos/logo_assistance_outline.svg",
                "assets/logos/logo_assistance.svg",
                Word.bottomNavigationHelp.text(),
                1,
              ),
              _buildNavItem(
                "assets/logos/logo_chat_outline.svg",
                "assets/logos/logo_chat.svg",
                Word.bottomNavigationChat.text(),
                2,
              ),
              _buildNavItem(
                "assets/logos/logo_profile_outline.svg",
                "assets/logos/logo_profile.svg",
                Word.bottomNavigationProfile.text(),
                3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 클래스 내에 새로운 메서드 추가
  BottomNavigationBarItem _buildNavItem(
    String icon,
    String activeIcon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Stack(
        clipBehavior: Clip.none,

        children: [SvgPicture.asset(icon, width: 24.r, height: 24.r)],
      ),
      activeIcon: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(
              activeIcon,
              width: 24.r,
              height: 24.r,
              // colorFilter: const ColorFilter.mode(
              //   Colors.black,
              //   // BlendMode.srcOut,
              // ),
            ),
            Positioned(
              top: -8.r,
              left: 0,
              right: 0,
              child: Container(
                height: 8.r,
                decoration: BoxDecoration(
                  color: AppConst.kPrimary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      label: label,
    );
  }
}
