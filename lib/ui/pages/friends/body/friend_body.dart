import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_birthday.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_favorites.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_list.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_main_profile.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_make_pop.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_title.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_update_profile.dart';
import 'package:team3_kakao/ui/pages/main_view_model.dart';

class FriendBody extends ConsumerWidget {
  const FriendBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MainPageModel? model = ref.watch(mainProvider);

    if (model?.mainDTO == null) {
      return CircularProgressIndicator();
    }

    MainDTO mainDTO = model!.mainDTO!;

    if (mainDTO.birthdayFriendList == null ||
        mainDTO.birthdayFriendList!.isEmpty) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FriendMainProfile(myProfile: mainDTO.userProfile!),
            FriendMakePop(),
            FriendTitle(count: mainDTO.friendList!.length),
            SizedBox(
              height: 1000,
              child: FriendList(friendsList: mainDTO.friendList),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FriendMainProfile(myProfile: mainDTO.userProfile!),
          FriendFavorites(favorites: mainDTO.favorites ?? []),
          FriendMakePop(),
          FriendBirthday(friendList: mainDTO.birthdayFriendList!),
          FriendTitle(count: mainDTO.friendList!.length),
          Container(
              height: 1000, child: FriendList(friendsList: mainDTO.friendList)),
        ],
      ),
    );
  }
}
