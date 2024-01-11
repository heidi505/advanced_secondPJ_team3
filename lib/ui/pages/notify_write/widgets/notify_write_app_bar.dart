import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';

class NotifyWirteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotifyWirteAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("글 작성하기"),
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, Move.chatNotifyPage);
        },
        icon: Icon(Icons.close),
      ),
      actions: [
        Container(
            width: 50,
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Move.chatNotifyPage);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent, // 배경색 투명
                  side: BorderSide.none,
                ),
                child: Text(
                  "완료",
                  style: TextStyle(color: Colors.grey),
                ))),
        //액션이 크기 무한으로 잡혀 있어서 너비를 정해줘야 함
        SizedBox(
          width: smallGap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
