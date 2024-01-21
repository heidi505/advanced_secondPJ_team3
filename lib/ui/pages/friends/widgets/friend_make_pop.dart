import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_sub_title.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_text_item.dart';

class FriendMakePop extends StatelessWidget {
  const FriendMakePop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: bgAndLineColor, width: 1.0),
          bottom: BorderSide(
            color: bgAndLineColor,
            width: 1.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FriendSubTitle(
              title: "펑",
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
              child: FriendTextItem(
                imagePath: "assets/icons/pop_icon.svg",
                text: "나의 펑을 만들어보세요!",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
