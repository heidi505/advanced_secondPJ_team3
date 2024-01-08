import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/chat_person_count.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_profile.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';

class ChattingList extends StatelessWidget {
  const ChattingList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) =>
            ChattingItem(
                title: "채팅방 제목",
                peopleCount: 4,
                imagePath: "assets/images/basic_img.jpeg",
                imageWidth: 40,
                imageHeight: 40,
                circular: 16.0,
                subTitle: "마지막 메세지",
              multiItem: Text("14:02", style: TextStyle(color: Colors.grey),),),

      //여기 나중에 동적으로처리해야함
          childCount: 20),
    ),);
  }
}
