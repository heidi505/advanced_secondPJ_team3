
import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';

class InfoText extends StatelessWidget {
  String text;

  InfoText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: smallGap, bottom: smallGap),
      child: Text("$text", style: TextStyle(fontSize: 13, color: basicColorB7)),
    );
  }
}

class FormLineText extends StatelessWidget {
  String text;

  FormLineText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 전체 너비를 차지하도록 설정
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1.0, color: formColor)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text("$text"),
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  String text;

  BoldText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    );
  }
}

class LogoutButton extends StatelessWidget {
  String text;

  LogoutButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: TextButton(
        onPressed: () {},
        child: Text("$text"),
      ),
    );
  }
}
