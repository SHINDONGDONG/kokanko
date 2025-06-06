import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kokanko/common/widgets/text_widghet.dart';
import 'package:kokanko/constans/colors.dart';

class TopTabbarWidget extends HookWidget implements PreferredSizeWidget {
  const TopTabbarWidget(this.onTabChanged, {super.key});

  final Function(int index)? onTabChanged;

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);
    final currentIndex = useState(tabController.index);

    useEffect(() {
      void listener() {
        // TabController의 index 변화를 감지해서 useState 업데이트
        // 이 업데이트가 TopTabbarWidget의 리빌드를 트리거해서 탭 색깔이 바뀜
        currentIndex.value = tabController.index;
      }

      // TabController에 리스너 등록
      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, [tabController]); // tabController가 변경될 때만 effect 다시 실행

    return Container(
      decoration: _buildContainerDecoration(),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: _buildTabBar(tabController, currentIndex.value),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.08),
          offset: const Offset(0, 2), // y축 2픽셀
          blurRadius: 2, // blur 4
        ),
      ],
      color: AppConst.kInactiveBg,
      borderRadius: BorderRadius.circular(12.r),
    );
  }

  TabBar _buildTabBar(TabController controller, int currentIndex) {
    return TabBar(
      controller: controller,
      labelColor: AppConst.kWhite,
      unselectedLabelColor: AppConst.kInactiveText,
      indicatorColor: AppConst.kPrimary,
      indicator: const BoxDecoration(),
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 0,
      labelPadding: EdgeInsets.zero,
      onTap: (value) => onTabChanged?.call(value),
      tabs: [
        _buildTab(currentIndex, 0, "交換"),
        _buildTab(currentIndex, 1, "ゆずる"),
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

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
