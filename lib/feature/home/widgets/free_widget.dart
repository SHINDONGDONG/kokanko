import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kokanko/common/enum/words.dart';
import 'package:kokanko/common/widgets/text_widghet.dart';
import 'package:kokanko/constans/colors.dart';

class FreeWidget extends StatelessWidget {
  const FreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/imgs/img_empty_data.svg"),
          TextWidget(
            text: Words.emptyFreeItem.text(),
            fontWeight: FontWeight.w500,
            fontColor: AppConst.kInactiveText,
          ),
          Gap(100.h),
        ],
      ),
    );
  }
}
