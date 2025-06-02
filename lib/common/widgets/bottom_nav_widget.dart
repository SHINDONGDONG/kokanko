// import 'package:flutter/material.dart';
// import 'package:kokanko/feature/chat/screen/chat_screen.dart';
// import 'package:kokanko/feature/home/screen/home_screen.dart';
// import 'package:kokanko/feature/profile/screen/profile_screen.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

// List<PersistentTabConfig> _buildScreens() {
//   return [
//     PersistentTabConfig(
//       screen: const HomeScreen(),
//       item: ItemConfig(icon: Icon(Icons.home), title: "Home"),
//     ),
//     PersistentTabConfig(
//       screen: const ChatScreen(),
//       item: ItemConfig(icon: Icon(Icons.message), title: "Messages"),
//     ),
//     PersistentTabConfig(
//       screen: const ProfileScreen(),
//       item: ItemConfig(icon: Icon(Icons.settings), title: "Settings"),
//     ),
//     PersistentTabConfig(
//       screen: const ProfileScreen(),
//       item: ItemConfig(icon: Icon(Icons.settings), title: "Settings"),
//     ),
//   ];
// }

// class PersistenBottomNavBarDemo extends StatelessWidget {
//   const PersistenBottomNavBarDemo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       backgroundColor: Colors.transparent,
//       tabs: _buildScreens(),
//       navBarBuilder:
//           (navBarConfig) => Style4BottomNavBar(
//             navBarConfig: navBarConfig,

//             // itemAnimationProperties: ItemAnimation(
//             //   duration: Duration(milliseconds: 200),
//             //   curve: Curves.easeInOut,
//             // ),
//           ),
//     );
//   }
// }

// TabBar와 TabBarView를 관리할 StatefulWidget
// SingleTickerProviderStateMixin을 믹스인 해줘야 TabController를 쓸 수 있어!
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ChatScreen(),
    ProfileScreen(),
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
                Icons.home_outlined,
                Icons.home,
                Word.bottomNavigationHome.text(),
                0,
              ),
              _buildNavItem(
                Icons.search_outlined,
                Icons.search,
                Word.bottomNavigationHelp.text(),
                1,
              ),
              _buildNavItem(
                Icons.person_outline,
                Icons.person,
                Word.bottomNavigationChat.text(),
                2,
              ),
              _buildNavItem(
                Icons.menu,
                Icons.menu,
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
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Stack(
        clipBehavior: Clip.none,

        children: [
          Icon(icon, size: 24.r),
          // if (_selectedIndex == index)
          // Positioned(
          //   top: -8.r,
          //   left: 0,
          //   right: 0,
          //   child: Container(
          //     height: 4.r,
          //     decoration: BoxDecoration(
          //       color: AppConst.kPrimary,
          //       borderRadius: BorderRadius.circular(2.r),
          //     ),
          //   ),
          // ),
        ],
      ),
      activeIcon: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Icon(activeIcon, size: 24.r),
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
