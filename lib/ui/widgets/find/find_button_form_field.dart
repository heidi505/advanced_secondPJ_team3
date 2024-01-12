import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/ui/pages/user/login/login_page.dart';

import '../../../_core/constants/size.dart';
import '../../pages/user/find/find_account_check_page.dart';
import '../../pages/user/find/find_password_page.dart';
import '../../pages/user/join/join_welcome_page.dart';

class FindButton extends StatelessWidget {
  String text;

  FindButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: largeGap, bottom: xsmallGap),
      child: TextButton(
          onPressed: () {
            // 버튼 클릭 시 join_agree_page.dart로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FindAccountCheckPage()),
            );
          },
          child: Text("$text")),
    );
  }
}

class LoginButton extends StatelessWidget {
  String text;

  LoginButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: smallGap, bottom: xsmallGap),
      child: TextButton(
          onPressed: () {
            // 버튼 클릭 시 join_agree_page.dart로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: basicColorW,
            side: BorderSide(color: Colors.deepOrangeAccent),
          ),
          child: Text("$text", style: TextStyle(color: Colors.deepOrangeAccent),)),
    );
  }
}

class FindPasswordButton extends StatelessWidget {
  String password;

  FindPasswordButton({required this.password});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10), // 간격 조절
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FindPasswordPage()),
              );
            },
            child: Text(
              "$password",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
