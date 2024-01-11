import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';

class FriendList extends StatelessWidget {
  const FriendList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ChattingItem(
            circular: 16.0,
            imageWidth: 40,
            imageHeight: 40,
            imagePath: "assets/images/basic_img.jpeg",
            title: "김하얀",
            subTitle: "3조 프로젝트 화이팅",
            ontap: () {
              Navigator.pushNamed(context, Move.profilePage);
            },
          ),
          childCount: 20,
        ),
      ),
    );
  }
}
