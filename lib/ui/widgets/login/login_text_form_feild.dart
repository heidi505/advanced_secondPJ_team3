import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/size.dart';


import '../../pages/user/join/join_check_page.dart';
import '../join/join_button_form_feild.dart';

class LoginTextFormField extends StatelessWidget {
  String text;

  LoginTextFormField({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: xsmallGap, bottom: mediumGap),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "$text",
            ),
          ),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  String text;

  LoginButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: TextButton(onPressed: () {}, child: Text("$text")),
    );
  }
}

class JoinButton extends StatelessWidget {
  String text;

  JoinButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: TextButton(
          onPressed: () {
            // 버튼 클릭 시 join_agree_page.dart로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JoinCheckPage()),
            );
          },
          child: Text("$text")),
    );
  }
}

class LoginTitle extends StatelessWidget {
  String text;

  LoginTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(largeGap),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "$text",
          style: TextStyle(fontSize: mediumGap),
        ),
      ),
    );
  }
}
