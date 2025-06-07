import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kokanko/common/enum/words.dart';
import 'package:kokanko/common/widgets/text_widghet.dart';
import 'package:kokanko/common/widgets/top_tabbar_widget.dart';

class ChatScreen extends HookWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: double.infinity,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                text: Words.bottomNavigationChat.text(),
                fontWeight: FontWeight.bold,
                fontsize: 18,
              ),
              const Icon(Icons.chat_bubble_outline),
            ],
          ),
        ),
        bottom: TopTabbarWidget((index) => currentIndex.value = index),
      ),

      body: Center(
        child: IndexedStack(
          index: currentIndex.value,
          children: const [
            TextWidget(
              text: 'Chat List',
              fontsize: 16,
              fontWeight: FontWeight.w500,
            ),
            TextWidget(
              text: 'Chat Detail',
              fontsize: 16,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
