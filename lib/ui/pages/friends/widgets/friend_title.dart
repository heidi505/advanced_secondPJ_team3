import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_sub_title.dart';

class FriendTItle extends StatelessWidget {
  const FriendTItle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FriendSubTitle(
        title: "친구 11",
      ),
    );
  }
}
