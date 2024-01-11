import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/pages/chat_notify/widgets/notify_app_bar.dart';
import 'package:team3_kakao/ui/pages/chat_notify/widgets/notify_tab_bar.dart';
import 'package:team3_kakao/ui/widgets/appbar/main_app_bar.dart';

class ChatNotifyPage extends StatelessWidget {
  const ChatNotifyPage({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotifyAppBar(),
      body: Column(
        children: [
          NotifyTabBar(),
        ],
      ),
    );
  }
}

