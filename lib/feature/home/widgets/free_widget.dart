import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kokanko/common/enum/words.dart';
import 'package:kokanko/common/widgets/text_widghet.dart';
import 'package:kokanko/constans/colors.dart';
import 'package:kokanko/feature/home/widgets/emtpy_item_widget.dart';

class FreeWidget extends StatelessWidget {
  const FreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        "id": 1,
        "title": "テーブル",
        "imagePath":
            "https://fastly.picsum.photos/id/1072/200/200.jpg?hmac=jar1_w-0fdzV_d70mmk9VzkBQA9B_oSZuZs21we31ZE",
        "author": "谷中",
        "date": "26",
      },
      {
        "id": 2,
        "title": "冷蔵庫",
        "imagePath":
            "https://fastly.picsum.photos/id/1072/200/200.jpg?hmac=jar1_w-0fdzV_d70mmk9VzkBQA9B_oSZuZs21we31ZE",
        "author": "浅草",
        "date": "25",
      },
      {
        "id": 3,
        "title": "洗濯機",
        "imagePath":
            "https://fastly.picsum.photos/id/1072/200/200.jpg?hmac=jar1_w-0fdzV_d70mmk9VzkBQA9B_oSZuZs21we31ZE",
        "author": "上野",
        "date": "24",
      },
      {
        "id": 4,
        "title": "ソファー",
        "imagePath":
            "https://fastly.picsum.photos/id/1072/200/200.jpg?hmac=jar1_w-0fdzV_d70mmk9VzkBQA9B_oSZuZs21we31ZE",
        "author": "秋葉原",
        "date": "24",
      },
      {
        "id": 5,
        "title": "テレビ",
        "imagePath":
            "https://fastly.picsum.photos/id/1072/200/200.jpg?hmac=jar1_w-0fdzV_d70mmk9VzkBQA9B_oSZuZs21we31ZE",
        "author": "新宿",
        "date": "23",
      },
      {
        "id": 6,
        "title": "エアコン",
        "imagePath":
            "https://fastly.picsum.photos/id/1072/200/200.jpg?hmac=jar1_w-0fdzV_d70mmk9VzkBQA9B_oSZuZs21we31ZE",
        "author": "渋谷",
        "date": "23",
      },
      {
        "id": 7,
        "title": "掃除機",
        "imagePath":
            "https://fastly.picsum.photos/id/1072/200/200.jpg?hmac=jar1_w-0fdzV_d70mmk9VzkBQA9B_oSZuZs21we31ZE",
        "author": "池袋",
        "date": "22",
      },
      {
        "id": 8,
        "title": "電子レンジ",
        "imagePath":
            "https://fastly.picsum.photos/id/1072/200/200.jpg?hmac=jar1_w-0fdzV_d70mmk9VzkBQA9B_oSZuZs21we31ZE",
        "author": "恵比寿",
        "date": "22",
      },
      {
        "id": 9,
        "title": "炊飯器",
        "imagePath":
            "https://fastly.picsum.photos/id/1072/200/200.jpg?hmac=jar1_w-0fdzV_d70mmk9VzkBQA9B_oSZuZs21we31ZE",
        "author": "目黒",
        "date": "21",
      },
      {
        "id": 10,
        "title": "加湿器",
        "imagePath":
            "https://fastly.picsum.photos/id/1072/200/200.jpg?hmac=jar1_w-0fdzV_d70mmk9VzkBQA9B_oSZuZs21we31ZE",
        "author": "品川",
        "date": "21",
      },
      {
        "id": 11,
        "title": "扇風機",
        "imagePath":
            "https://fastly.picsum.photos/id/1072/200/200.jpg?hmac=jar1_w-0fdzV_d70mmk9VzkBQA9B_oSZuZs21we31ZE",
        "author": "六本木",
        "date": "20",
      },
      {
        "id": 12,
        "title": "照明",
        "imagePath":
            "https://fastly.picsum.photos/id/1072/200/200.jpg?hmac=jar1_w-0fdzV_d70mmk9VzkBQA9B_oSZuZs21we31ZE",
        "author": "銀座",
        "date": "20",
      },
    ];

    return items.length.isNaN
        ? Center(child: EmptyItemWidget(text: Words.emptyFreeItem.text()))
        : Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 4.w,
                children: [
                  TextWidget(
                    text: Words.meanIcon.text(),
                    fontsize: 12,
                    fontColor: AppConst.kTextSecondary,
                  ),
                  SvgPicture.asset("assets/logos/logo_question.svg"),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: items.length,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(16.r),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 9.w,
                  mainAxisSpacing: 16.r,
                ),

                itemBuilder:
                    (context, index) => Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: AppConst.kBackground,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2.h),
                            blurRadius: 2,
                            color: Colors.black.withValues(alpha: .08),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    items[index]["imagePath"],
                                  ),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  SvgPicture.asset("assets/logos/bad.svg"),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Row(
                                      spacing: 4.r,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/logos/logo_chat.svg",
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                    AppConst.kWhite,
                                                    BlendMode.srcATop,
                                                  ),
                                              width: 16.r,
                                              height: 16.r,
                                            ),
                                            Gap(4.w),
                                            TextWidget(
                                              text: "7",
                                              fontColor: AppConst.kWhite,
                                              fontsize: 12.sp,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              width: 16.r,
                                              height: 16.r,
                                              "assets/logos/logo_favorite_.svg",
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                    AppConst.kWhite,
                                                    BlendMode.srcATop,
                                                  ),
                                            ),
                                            Gap(4.w),
                                            TextWidget(
                                              text: "7",
                                              fontColor: AppConst.kWhite,
                                              fontsize: 12.sp,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 8.r,
                              horizontal: 12.r,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(text: items[index]["title"]),
                                TextWidget(
                                  text:
                                      "${items[index]["title"]}・${items[index]["date"]}秒前",
                                  fontColor: AppConst.kTextSecondary,
                                  fontsize: 12.sp,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          ],
        );
  }
}
