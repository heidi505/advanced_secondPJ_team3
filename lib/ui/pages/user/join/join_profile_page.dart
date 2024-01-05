import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:team3_kakao/ui/widgets/join/join_button_form_field.dart';
import 'package:team3_kakao/ui/widgets/join/join_text_form_field.dart';

import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/size.dart';

class JoinProfilePage extends StatelessWidget {
  // const JoinProfilePage({super.key});
  const JoinProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(mediumGap),
        child: ListView(
          children: [
            JoinTitle(text: "카카오 계정 프로필을\n설정해 주세요."),
            TextFormHint(text: "닉네임"),
            InsertText(text: "닉네임 입력"),
            TextFormHint(text: "\n생일"),
            InsertText(text: "생일 날짜 입력"),
            TextFormHint(text: "\n성별"),
            RadioButtons(),
            TextFormHint(text: "\n핸드폰 번호"),
            InsertText(text: "- 없이 핸드폰 번호를 입력해 주세요."),
            WelcomePageButton(
              text: "확인",
            ),
          ],
        ),
      ),
    );
  }
}