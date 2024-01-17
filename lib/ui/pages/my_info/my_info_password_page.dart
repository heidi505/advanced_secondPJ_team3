import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/my_info/my_info_page.dart';

import '../../../_core/constants/color.dart';
import '../../widgets/join/join_button_form_field.dart';
import '../../widgets/my_info/my_info_button_form_field.dart';
import '../../widgets/my_info/my_info_text_form_field.dart';

class MyInfoPasswordPage extends StatefulWidget {
  // const MyInfoPage({super.key});
  const MyInfoPasswordPage();

  @override
  State<MyInfoPasswordPage> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoPasswordPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "비밀번호 재설정",
          ),
          bottom: PreferredSize(
            child: Container(
              color: formColor,
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(1.0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(mediumGap),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoTitle(text: "새로운 비밀번호를 입력해 주세요."),
              InfoTextFormHint(text: "비밀번호"),
              PasswordInsertText(text: "비밀번호 입력 (8~32자리)" ),
              PasswordInsertText(text: "비밀번호 재입력"),
              InfoSubText(text: "· 비밀번호는 8~32자리의 영문 대소문자, 특수문자를 조합하여 설정해 주세요."),
              InfoSubText(text: "· 다른 사이트에서 사용하는 것과 동일하거나 쉬운 비밀번호는 사용하지 마세요."),
              InfoSubText(text: "· 안전한 계정 사용을 위해 비밀번호는 추가적으로 변경해 주세요.\n"),
              MyPasswordUpdateButton(text: "확인"),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPasswordUpdateButton extends StatelessWidget {
  final String text;


  MyPasswordUpdateButton({required this.text});

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