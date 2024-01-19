import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:team3_kakao/_core/constants/theme.dart';
import 'package:team3_kakao/ui/widgets/appbar/chat_main_app_bar.dart';
import 'package:team3_kakao/ui/widgets/appbar/main_app_bar.dart';

import '../../../_core/constants/size.dart';
import '../../widgets/chatting_items/chatting_item.dart';
import 'body/chatting_body.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChattingMainAppBar(
          title: "채팅",
          imagePathL: "assets/icons/search_icon.svg",
          imagePathR: "assets/icons/chat_add_icon.svg"),
      body: ChattingBody(),
    );
  }
}
