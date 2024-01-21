import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_sub_title.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_text_item.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';

import '../../../../_core/constants/http.dart';
import '../../../../data/dto/friend_dto/main_dto.dart';

class FriendBirthday extends StatelessWidget {
  final List<FriendsDTO> friendList;
  const FriendBirthday({super.key, required this.friendList});

  @override
  Widget build(BuildContext context) {
    List<String> parsedBirthdate = friendList
        .map((e) => e.birthdate?.split("-"))
        .map((i) => i![1] + "-" + i[2])
        .toList();

    return Container(
      decoration: BoxDecoration(
        border: Border(
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
              title: "생일인 친구",
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        ChattingItem(
                          ontap: () {
                            Navigator.pushNamed(context, Move.profilePage);
                          },
                          circular: 16.0,
                          imageWidth: 40,
                          imageHeight: 40,
                          imagePath:
                              baseUrl + "/images/${friendList[0].userId}.jpg",
                          title: "${friendList[0].nickname}",
                          subTitle: parsedBirthdate[0],
                        ),
                        ChattingItem(
                          ontap: () {
                            Navigator.pushNamed(context, Move.profilePage);
                          },
                          circular: 16.0,
                          imageWidth: 40,
                          imageHeight: 40,
                          imagePath:
                              baseUrl + "/images/${friendList[1].userId}.jpg",
                          title: "${friendList[1].nickname}",
                          subTitle: parsedBirthdate[1],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: smallGap,
                  ),
                  FriendTextItem(
                      imagePath: "assets/icons/cake_icon.svg",
                      text: "친구의 생일을 확인해보세요!")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
