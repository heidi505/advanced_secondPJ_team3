import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';
import '../../../../data/dto/friend_dto/main_dto.dart';

class FriendList extends StatelessWidget {
  List<FriendsDTO>? friendsList;
  FriendList({super.key, this.friendsList});

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
            imagePath: baseUrl + "/images/${friendsList![index].userId}.jpg",
            title: friendsList![index].nickname!,
            subTitle: friendsList![index].statusMessage,
          ),
          childCount: friendsList!.length,
        ),
      ),
    );
  }
}
