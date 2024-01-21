import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_profile.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_sub_title.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';

import '../../../../_core/constants/http.dart';
import '../../../../_core/constants/move.dart';
import '../../../../data/dto/chat_dto/chatting_list_page_dto.dart';
import '../../../../data/provider/param_provider.dart';

class FriendFavorites extends ConsumerWidget {
  List<ChatroomDTO> favorites;
  FriendFavorites({super.key, required this.favorites});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Container(
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
                title: "즐겨찾기",
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    Container(
                        height: favorites!.length * 70,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GroupProfile(
                                imagePath:
                                    "$baseUrl/images/${favorites[index].userIdList![0]}.jpg",
                                title: favorites[index].chatName,
                                chatDocId: favorites[index].chatDocId,
                                peopleCount: favorites[index]
                                    .userIdList!
                                    .length
                                    .toString(),
                                userIdList: favorites[index].userIdList,
                                ontap: () {
                                  ref
                                      .read(paramProvider)
                                      .addChatRoomDTO(favorites[index]);
                                  ref.read(paramProvider).addChatRoomDocId(
                                      favorites[index].chatDocId!);
                                  Navigator.pushNamed(
                                      context, Move.chatRoomPage);
                                });
                          },
                          itemCount: favorites.length,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
