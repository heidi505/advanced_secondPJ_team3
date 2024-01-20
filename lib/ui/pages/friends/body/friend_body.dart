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
  const FriendBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MainPageModel? model = ref.watch(mainProvider);

    if (model?.mainDTO == null) {
      return CircularProgressIndicator();
    }

    MainDTO mainDTO = model!.mainDTO!;
    // if (mainDTO!.birthdayFriendList == null ||
    //     mainDTO!.birthdayFriendList!.isEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FriendMainProfile(myProfile: mainDTO!.userProfile!),
        FriendMakePop(),
        FriendTItle(count: mainDTO.friendList!.length),
        FriendList(friendsList: mainDTO!.friendList),
      ],
    );
  } // else {
  //   return CustomScrollView(
  //     slivers: [
  //       FriendMainProfile(myProfile: mainDTO!.userProfile!),
  //       FriendMakePop(),
  //       FriendBirthday(friendList: mainDTO!.birthdayFriendList!),
  //       FriendTItle(count: mainDTO.friendList!.length),
  //       FriendList(friendsList: mainDTO!.friendList),
  //     ],
  //   );
  // }
}
