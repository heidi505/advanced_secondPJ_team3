import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/ui/pages/chatting/chat_name_set_page.dart';

class ChatMenuModalBox extends StatelessWidget {
  final void Function()? ontap;
  final Widget text;
  ChatMenuModalBox({
    Key? key, // 수정된 부분
    this.ontap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: ontap,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(0, 0),
        side: BorderSide.none,
        foregroundColor: basicColorB5,
        padding: EdgeInsets.zero,
      ),
      child: text,
    );
  }
}
