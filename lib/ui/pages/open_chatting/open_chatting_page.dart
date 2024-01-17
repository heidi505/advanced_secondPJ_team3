import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:team3_kakao/_core/constants/theme.dart';
import 'package:team3_kakao/ui/pages/open_chatting/body/open_chatting_body.dart';
import 'package:team3_kakao/ui/widgets/appbar/main_app_bar.dart';

import '../../../_core/constants/size.dart';
import '../../widgets/chatting_items/chatting_item.dart';

class OpenChattingPage extends StatelessWidget {
  const OpenChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          title: "오픈채팅",
          imagePathL: "assets/icons/search_icon.svg",
          imagePathR: "assets/icons/my_icon.svg"),
      body: OnenChattingBody(),
    );
  }
}
