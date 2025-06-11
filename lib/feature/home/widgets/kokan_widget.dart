import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kokanko/common/enum/words.dart';
import 'package:kokanko/common/widgets/text_widghet.dart';
import 'package:kokanko/constans/colors.dart';
import 'package:kokanko/feature/home/widgets/emtpy_item_widget.dart';

class KokanWidget extends StatelessWidget {
  const KokanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> itemList = [
      {
        "imagePath": "assets/imgs/kokan_img.png",
        "category": "子ども服",
        "kokan": "交換希望",
        "title": "ベビーシューズ、絵本",
        "author": "谷中",
        "date": "25",
        "comments": 3,
        "likes": 5,
      },
    ];

    return itemList.length.isNaN
        ? Center(child: EmptyItemWidget(text: Words.emptyKokanItem.text()))
        : ListView.separated(
          padding: EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w),
          itemCount: 10,
          separatorBuilder:
              (context, index) => Container(
                margin: EdgeInsets.symmetric(vertical: 8.h),
                height: 1,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: AppConst.kDivider),
                ),
              ),
          itemBuilder:
              (context, index) => SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8.w,
                  children: [
                    Container(
                      width: 109.r,
                      height: 109.r,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage(itemList[0]["imagePath"]),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x28000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15.h,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 16.w,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 8.h,
                                    children: [
                                      TextWidget(
                                        text: itemList[0]["category"],
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 2,
                                        children: [
                                          TextWidget(
                                            text: itemList[0]["kokan"],
                                            fontWeight: FontWeight.w500,
                                            fontsize: 12.sp,
                                            fontColor: AppConst.kPrimary,
                                          ),
                                          TextWidget(
                                            text: itemList[0]["title"],
                                            fontWeight: FontWeight.bold,
                                            fontColor: AppConst.kTextPrimary,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset("assets/logos/good.svg"),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 4.w,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4.w,
                                  children: [
                                    TextWidget(
                                      text:
                                          "${itemList[0]["author"]}・${itemList[0]["date"]}秒前",
                                      fontColor: AppConst.kTextSecondary,
                                      fontsize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 4.w,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      spacing: 4.w,
                                      children: [
                                        SizedBox(
                                          width: 16.w,
                                          height: 16.w,
                                          // clipBehavior: Clip.antiAlias,
                                          // decoration: const BoxDecoration(),
                                          child: SvgPicture.asset(
                                            "assets/logos/logo_chat_outline.svg",
                                          ),
                                        ),
                                        TextWidget(
                                          text: "${itemList[0]["comments"]}",
                                          fontsize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          fontColor: AppConst.kTextSecondary,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      spacing: 2,
                                      children: [
                                        SizedBox(
                                          width: 16.w,
                                          height: 16.w,
                                          child: SvgPicture.asset(
                                            "assets/logos/logo_favorite.svg",
                                          ),
                                        ),
                                        TextWidget(
                                          text: "${itemList[0]["likes"]}",
                                          fontsize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          fontColor: AppConst.kTextSecondary,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        );
  }
}
