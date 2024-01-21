import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/widgets/appbar/main_app_bar.dart';
import 'body/friend_body.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(
          title: "친구",
          imagePathL: "assets/icons/search_icon.svg",
          imagePathR: "assets/icons/friend_add_icon.svg",
        ),
        body: FriendBody());
  }
}
