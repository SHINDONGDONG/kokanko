import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kokanko/common/enum/categories.dart';
import 'package:kokanko/common/enum/words.dart';
import 'package:kokanko/common/widgets/text_widghet.dart';
import 'package:kokanko/constans/colors.dart';

class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = usePageController(initialPage: 0);
    final currentPage = useState(0);
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          toolbarHeight: 52.r,
          leadingWidth: double.infinity,
          leading: Padding(
            padding: EdgeInsets.symmetric(vertical: 6.r, horizontal: 16.w),
            child: Row(
              spacing: 8.r,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [_buildBackbutton(context), _buildSearchBox()],
            ),
          ),
          bottom: _buildTabbar(),
        ),

        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: Words.category.text(),
                fontWeight: FontWeight.bold,
              ),
              Gap(16.h),
              _buildCatetories(currentPage, pageController),
              Gap(16.h),
              _buildPageDotsIndicator(currentPage.value),
              Gap(50.h),
              _buildHistoryDeleteLabel(),
              Gap(8.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder:
                      (context, index) => _buildHitoryItem(text: "検索$index"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 검색 박스 빌드 메서드
  Expanded _buildSearchBox() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 8.r, top: 8.r, bottom: 8.r),
        height: 52.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppConst.kOtherBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              offset: const Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: TextField(
          onTap: () {},
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: FittedBox(
              child: SvgPicture.asset(
                "assets/logos/logo_search.svg",
                colorFilter: const ColorFilter.mode(
                  AppConst.kInactiveText,
                  BlendMode.srcIn,
                ),
                fit: BoxFit.cover,
                semanticsLabel: 'search icon',
              ),
            ),
            hintText: Words.searchForItem.text(),
            hintStyle: TextStyle(
              color: AppConst.kInactiveText,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }

  // 뒤로가기 버튼 빌드 메서드
  GestureDetector _buildBackbutton(BuildContext context) {
    return GestureDetector(
      onTap: context.pop,
      child: SvgPicture.asset(
        "assets/imgs/img_back_button.svg",
        fit: BoxFit.cover,
        semanticsLabel: 'back button',
      ),
    );
  }

  // 빌드 탭바 메서드
  TabBar _buildTabbar() {
    return TabBar(
      unselectedLabelColor: AppConst.kInactiveText,
      labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      splashFactory: NoSplash.splashFactory,
      dividerColor: AppConst.kBorderLine,
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(text: Words.kokan.text()),
        Tab(text: Words.free.text()),
        Tab(text: Words.bottomNavigationHelp.text()),
      ],
    );
  }

  // 카테고리 빌드 메서드
  SizedBox _buildCatetories(
    ValueNotifier<int> currentPage,
    PageController pageController,
  ) {
    return SizedBox(
      height: 146.h,
      child: PageView.builder(
        onPageChanged: (value) => currentPage.value = value,
        controller: pageController,
        itemCount: (CategoryType.values.length / 8).ceil(),
        itemBuilder: (context, pageIndex) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16.h,
              mainAxisExtent: 65.h,
            ),
            itemCount: min(8, CategoryType.values.length - pageIndex * 8),
            itemBuilder: (context, index) {
              index += pageIndex * 8; // 페이지 인덱스에 따라 조정
              return Center(
                child: _buildCategoryItem(
                  imagePath: CategoryType.values[index].imagePath,
                  category: CategoryType.values[index].name,
                ),
              );
            },
          );
        },
      ),
    );
  }

  // 페이지 도트 인디케이터 빌드 메서드
  Center _buildPageDotsIndicator(int currentPage) {
    return Center(
      child: DotsIndicator(
        position: currentPage.toDouble(),
        dotsCount: (CategoryType.values.length / 8).ceil(),
        decorator: DotsDecorator(
          activeColor: AppConst.kPrimary,
          size: Size(8.r, 8.r),
          color: AppConst.kBorderLine,
          activeSize: Size(10.r, 10.r),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
      ),
    );
  }

  // 검색 히스토리 삭제 레이블 빌드 메서드
  Row _buildHistoryDeleteLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: Words.searchHistory.text(),
          fontWeight: FontWeight.bold,
          fontsize: 16,
        ),
        GestureDetector(
          onTap: () => (),
          child: TextWidget(
            text: Words.allDelete.text(),
            fontWeight: FontWeight.bold,
            fontsize: 16,
            fontColor: AppConst.kInactiveText,
          ),
        ),
      ],
    );
  }

  // 검색 히스토리 아이템 빌드 메서드
  Row _buildHitoryItem({required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 24.r,
              height: 24.r,
              child: SvgPicture.asset(
                "assets/logos/logo_clock.svg",
                fit: BoxFit.none,
              ),
            ),
            Gap(8.w),
            TextWidget(
              text: text,
              fontsize: 14,
              fontColor: AppConst.kTextPrimary,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 24.r,
            height: 24.r,
            child: SvgPicture.asset(
              "assets/logos/logo_close.svg",
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}

// 카테고리 아이템 빌드 메서드
Widget _buildCategoryItem({
  required String imagePath,
  required String category,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: EdgeInsets.all(10.h),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppConst.kWhite,
        ),
        child: SvgPicture.asset(imagePath, fit: BoxFit.contain),
      ),
      Gap(4.h),
      TextWidget(
        text: category,
        fontsize: 10,
        textAlign: TextAlign.center,
        fontColor: AppConst.kTextPrimary,
        lineHeight: 1.4.h,
      ),
    ],
  );
}
