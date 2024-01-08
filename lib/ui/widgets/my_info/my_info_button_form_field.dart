import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/pages/my_info/my_info_page.dart';

import '../../../_core/constants/size.dart';
import '../../pages/user/join/join_password_page.dart';

class MyInfoUpdateButton extends StatelessWidget {
  String text;

  MyInfoUpdateButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: TextButton(
          onPressed: () {
            // 버튼 클릭 시 join_agree_page.dart로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyInfoPage()),
            );
          },
          child: Text("$text")),
    );
  }
}