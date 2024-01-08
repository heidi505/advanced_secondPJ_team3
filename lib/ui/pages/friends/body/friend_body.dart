import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_birthday.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_favorites.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_list.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_main_profile.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_make_pop.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_title.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_update_profile.dart';

class FriendBody extends StatelessWidget {
  const FriendBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        FriendMainProfile(),
        FriendUpdateProfile(),
        FriendMakePop(),
        FriendBirthday(),
        FriendFavorites(),
        FriendTItle(),
        FriendList(),
      ],
    );
  }
}
