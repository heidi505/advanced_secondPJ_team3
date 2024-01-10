import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/widgets/join/join_button_form_field.dart';
import 'package:team3_kakao/ui/widgets/join/join_text_form_field.dart';

import '../../../../_core/constants/size.dart';

class JoinCheckPage extends StatefulWidget {
  @override
  _JoinCheckPageState createState() => _JoinCheckPageState();
}

class _JoinCheckPageState extends State<JoinCheckPage> {
  final TextEditingController authNumController = TextEditingController();
  bool _isAuthNumValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(mediumGap),
        child: ListView(
          children: [
            JoinTitle(text: "이메일로 발송된 \n인증번호를 입력해 주세요."),
            CheckEmail(),
            AuthNum(
              onValidationChanged: _updateAuthNumValidation,
            ),
            CheckErrorButton(text: "인증메일을 받지 못하셨나요?"),
            PasswordPageButton(
              text: "다음",
              authNumController: authNumController,
              isAuthNumValid: _isAuthNumValid,
            ),
          ],
        ),
      ),
    );
  }

  void _updateAuthNumValidation(bool isValid) {
    setState(() {
      _isAuthNumValid = isValid;
    });
  }
}
