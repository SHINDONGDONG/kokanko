import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kokanko/common/widgets/circle_blur_widget.dart';
import 'package:kokanko/common/widgets/top_tabbar_widget.dart';
import 'package:kokanko/constans/colors.dart';
import 'package:kokanko/feature/home/widgets/free_widget.dart';
import 'package:kokanko/feature/home/widgets/kokan_widget.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              GestureDetector(
                onTap: () => context.push("/search"),
                child: SvgPicture.asset("assets/logos/logo_search.svg"),
              ),
              Gap(16.w),
              SvgPicture.asset("assets/logos/logo_alram.svg"),
            ],
            bottom: TopTabbarWidget((index) => currentIndex.value = index),
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
}
