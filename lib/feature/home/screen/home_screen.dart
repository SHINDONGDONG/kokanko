import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kokanko/common/widgets/circle_blur_widget.dart';
import 'package:kokanko/common/widgets/text_widghet.dart';
import 'package:kokanko/constans/colors.dart';
import 'package:kokanko/feature/home/widgets/%08free_widget.dart';
import 'package:kokanko/feature/home/widgets/kokan_widget.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);
    final currentIndex = useState(0);
    final selectedValue = useState("江東区");

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color:
              currentIndex.value == 0
                  ? AppConst.kPrimaryLight
                  : AppConst.kSecondaryLight,
        ),
        const CircleBlurWidget(
          left: -208,
          top: -120,
          blurColor: AppConst.kPrimaryLight,
          blurRadius: 120,
          size: 400,
        ),
        const CircleBlurWidget(
          right: -240,
          bottom: -240,
          blurColor: AppConst.kSecondaryLight,
          blurRadius: 100,
          size: 480,
        ),
        Scaffold(
          floatingActionButton: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.16), // 16% 투명도
                  offset: const Offset(0, 2), // y축 2픽셀
                  blurRadius: 4, // blur 4
                ),
              ],
            ),
            child: FloatingActionButton(
              elevation: 0, // Container에서 그림자를 처리하므로 FAB의 기본 그림자는 제거
              backgroundColor:
                  currentIndex.value == 0
                      ? AppConst.kPrimary
                      : AppConst.kSecondary,
              shape: const OvalBorder(),
              onPressed: () {},
              child: SvgPicture.asset("assets/imgs/img_floating_add.svg"),
            ),
          ),
          appBar: AppBar(
            leadingWidth: 100.w,
            actionsPadding: EdgeInsets.symmetric(horizontal: 16.w),
            leading: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: DropdownButton<String>(
                elevation: 0,
                icon: SvgPicture.asset("assets/logos/logo_arrow_down.svg"),
                underline: const SizedBox.shrink(),
                // isExpanded: false,
                value: selectedValue.value,
                items:
                    <String>[
                      '江東区',
                      '品川区',
                      '目黒区',
                      '大田区',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                onChanged: (value) {},
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              SvgPicture.asset("assets/logos/logo_search.svg"),
              Gap(16.w),
              SvgPicture.asset("assets/logos/logo_alram.svg"),
            ],
            bottom: PreferredSize(
              preferredSize: Size.square(40.h),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      offset: const Offset(0, 2), // y축 2픽셀
                      blurRadius: 2, // blur 4
                    ),
                  ],
                  color: AppConst.kInactiveBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: TabBar(
                  controller: tabController,
                  labelColor: AppConst.kWhite,
                  unselectedLabelColor: AppConst.kInactiveText,
                  indicatorColor: AppConst.kPrimary,
                  indicator: const BoxDecoration(),
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 0,
                  labelPadding: EdgeInsets.zero,
                  onTap: (value) => currentIndex.value = value,
                  tabs: [
                    _buildTab(currentIndex.value, 0, "交換"),
                    _buildTab(currentIndex.value, 1, "ゆずる"),
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: IndexedStack(
              index: currentIndex.value,
              children: const [KokanWidget(), FreeWidget()],
            ),
          ),
        ),
      ],
    );
  }

  //Tab Widget
  Tab _buildTab(int currentIndex, int fixedIndex, String text) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color:
              currentIndex == 0 && fixedIndex == 0
                  ? AppConst.kPrimary
                  : currentIndex == 1 && fixedIndex == 1
                  ? AppConst.kSecondary
                  : AppConst.kInactiveBg,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: TextWidget(
          text: text,
          fontWeight: FontWeight.bold,
          fontColor:
              currentIndex == fixedIndex
                  ? AppConst.kWhite
                  : AppConst.kInactiveText,
        ),
      ),
    );
  }
}
