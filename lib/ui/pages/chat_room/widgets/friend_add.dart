import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/friend_dto/friend_search_response_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/open_profile_image.dart';

import '../../../../data/provider/add_friend_to_chat_provider.dart';

class FriendAdd extends ConsumerWidget {
  FriendsDTO? pickedFriend;
  FriendAdd({super.key, this.pickedFriend});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AddFriendToChatModel? model = ref.watch(addFriendToChatProvider);
    return Column(
      children: [
        Stack(
          children: [
            Container(
              child: OpenProfileImage2(
                imagePath: "$baseUrl/images/${pickedFriend!.userId}.jpg",
                imageWidth: 50,
                imageHeight: 50,
                circular: 20,
              ),
            ),
            Positioned(
              top: -2,
              right: -2,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  child: Image.asset(
                    "assets/icons/circle_close_icon.png",
                    fit: BoxFit.cover,
                    width: 20,
                    height: 20,
                    color: bgAndLineColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: xsmallGap,
        ),
        Text("${pickedFriend!.nickname}"),
      ],
    );
  }
}
