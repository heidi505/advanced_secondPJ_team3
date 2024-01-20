import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';

import 'package:team3_kakao/ui/pages/main_view_model.dart';
import 'package:team3_kakao/ui/pages/profile/profile_friend_page.dart';

import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';
import '../../../../data/dto/friend_dto/main_dto.dart';

class FriendList extends ConsumerWidget {
  List<FriendsDTO>? friendsList;

  FriendList({super.key, this.friendsList});

  final logger = Logger();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ParamStore paramStore = ref.read(paramProvider);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: friendsList!.length!,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ChattingItem(
                  ontap: () {
                    paramStore.addProfileDetail(friendsList![index]);
                    logger.d(
                        '즐찾 들어와줘어어어어 제바아알 ${friendsList![index].isFavorite}');
                    Navigator.pushNamed(context, Move.profilePage);
                  },
                  circular: 16.0,
                  imageWidth: 40,
                  imageHeight: 40,
                  imagePath:
                      "$baseUrl/images/${friendsList![index].userId}.jpg",
                  title: friendsList![index].nickname!,
                  subTitle: friendsList![index].statusMessage,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
