import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/ui/widgets/join/join_button_form_field.dart';
import 'package:team3_kakao/ui/widgets/join/join_text_form_field.dart';

import '../../../../_core/constants/color.dart';
import '../../../../_core/constants/size.dart';

class JoinProfilePage extends StatelessWidget {
  JoinProfilePage({Key? key, this.formKey}) : super(key: key);
  final GlobalKey? formKey;
  final _nickNameController = TextEditingController();
  final _phoneNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(mediumGap),
          child: ListView(
            children: [
              JoinTitle(text: "카카오 계정 프로필을\n설정해 주세요."),
              TextFormHint(text: "닉네임"),
              InsertNickName(
                  text: "닉네임 입력", nickNameController: _nickNameController),
              TextFormHint(text: "\n생일"),
              InsertBirthday(text: "생일 날짜 입력"),
              TextFormHint(text: "\n핸드폰 번호"),
              InsertPhoneNum(
                text: "- 없이 핸드폰 번호를 입력해 주세요.",
                phoneNumController: _phoneNumController,
              ),
              WelcomePageButton(
                nickNameController: _nickNameController!,
                phoneNumController: _phoneNumController!,
                text: "확인",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
