import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/widgets/join/join_button_form_feild.dart';
import 'package:team3_kakao/ui/widgets/join/join_text_form_feild.dart';

import '../../../../_core/constants/size.dart';

class JoinCheckPage extends StatelessWidget {
  const JoinCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(mediumGap),
        child: ListView(
          children: [
            JoinTitle(text: "이메일로 발송된 \n인증번호를 입력해 주세요."),
            InsertText(text: "ssar@naver.com"),
            InsertText(text: "인증번호 입력"),
            CheckErrorButton(text: "인증메일을 받지 못하셨나요?"),
            PasswordPageButton(
              text: "다음",
            ),
          ],
        ),
      ),
    );
  }
}
