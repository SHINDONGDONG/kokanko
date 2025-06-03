import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kokanko/common/enum/word.dart';
import 'package:kokanko/common/widgets/text_widghet.dart';
import 'package:kokanko/constans/colors.dart';

class KokanWidget extends StatelessWidget {
  const KokanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/imgs/img_empty_data.svg"),
          TextWidget(
            text: Word.emptyKokanItem.text(),
            fontWeight: FontWeight.w500,
            fontColor: AppConst.kInactiveText,
          ),
          Gap(100.h),
        ],
      ),
    );
  }
}
