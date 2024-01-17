import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';
import '../../../../data/dto/friend_dto/main_dto.dart';

class FriendList extends ConsumerWidget {
  List<FriendsDTO>? friendsList;
  FriendList({super.key, this.friendsList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ParamStore paramStore = ref.read(paramProvider);

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ChattingItem(
            ontap: () {
              paramStore.addProfileDetail(friendsList![index]);
              Navigator.pushNamed(context, Move.profilePage);
            },
            circular: 16.0,
            imageWidth: 40,
            imageHeight: 40,
            imagePath: "$baseUrl/images/${friendsList![index].userId}.jpg",
            title: friendsList![index].nickname!,
            subTitle: friendsList![index].statusMessage,
          ),
          childCount: friendsList!.length,
        ),
      ),
    );
  }
}
