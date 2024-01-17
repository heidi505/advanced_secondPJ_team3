import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/widgets/find/find_button_form_field.dart';
import 'package:team3_kakao/ui/widgets/find/find_text_form_field.dart';
import 'package:team3_kakao/ui/widgets/join/join_text_form_field.dart';

import '../../../widgets/my_info/my_info_text_form_field.dart';

class FindPasswordReset extends StatefulWidget {
  const FindPasswordReset();

  @override
  State<FindPasswordReset> createState() => _FindAccountScreenState();
}

class _FindAccountScreenState extends State<FindPasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(mediumGap),
        child: ListView(
          children: [
            LogoText(text: "kakao"),
            FindTitle(
              text: "카카오계정의 \n비밀번호를 재설정합니다.",
            ),
            FindHintText(text: "비밀번호를 재설정할 \n카카오계정의 이메일 또는 전화번호를 입력해 주세요."),
            Padding(
              padding: const EdgeInsets.only(top: mediumGap),
              child: CheckEmail(funcNum: 2),
            ),
            LoginButton(text: "로그인"),
          ],
        ),
      ),
    );
  }
}