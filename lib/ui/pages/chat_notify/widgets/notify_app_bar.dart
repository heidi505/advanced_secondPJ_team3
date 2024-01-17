import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/chat_notify/chat_notify_page.dart';
import 'package:team3_kakao/ui/pages/notify_write/notify_write_page.dart';

class NotifyAppBar extends StatelessWidget implements PreferredSizeWidget  {
  const NotifyAppBar({
    super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("심화반 2조"),
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, Move.chatRoomPage);
        },
        icon: Icon(Icons.close),
      ),
      actions: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, Move.NotifyWritePage);
          },
          child: Image.asset("assets/icons/profile/profile_icon_02.png",
            fit: BoxFit.cover,
            width: 30,
            height: 30,
          ),
        ),
        SizedBox(width: smallGap,),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
