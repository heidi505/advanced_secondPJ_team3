import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_sub_title.dart';

class FriendTitle extends StatelessWidget {
  int? count;
  FriendTitle({super.key, this.count});

  @override
  Widget build(BuildContext context) {
    return FriendSubTitle(
      title: "친구 $count",
    );
  }
}
