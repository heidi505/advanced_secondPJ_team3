import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:team3_kakao/_core/constants/theme.dart';

import '../../../_core/constants/size.dart';
import '../../widgets/chatting_items/chatting_item.dart';

class ChattingPage extends StatelessWidget {
  const ChattingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("채팅"),
              SizedBox(width: 16),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              "assets/icons/search_icon.svg",
              fit: BoxFit.cover,
              width: 25,
              height: 25,
            ),
          ),
          SizedBox(
            width: xsmallGap,
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              "assets/icons/friend_add_icon.svg",
              fit: BoxFit.cover,
              width: 25,
              height: 25,
            ),
          ),
          SizedBox(
            width: mediumGap,
          ),
        ],
      ),
      body: Column(
        children: [
         Text("채팅페이지"),
        ],
      ),
    );
  }
}
