import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/ui/pages/user/join/join_form_view_model.dart';
import 'package:team3_kakao/ui/widgets/join/join_button_form_field.dart';
import 'package:team3_kakao/ui/widgets/join/join_text_form_field.dart';

import '../../../../_core/constants/size.dart';

class JoinCheckPage extends ConsumerStatefulWidget {
  @override
  _JoinCheckPageState createState() => _JoinCheckPageState();
}

class _JoinCheckPageState extends ConsumerState<JoinCheckPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController authNumController = TextEditingController();

  bool _isAuthNumValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(mediumGap),
          child: ListView(
            children: [
              JoinTitle(text: "이메일로 발송된 \n인증번호를 입력해 주세요."),
              CheckEmail(funcNum: 1),
              AuthNum(
                authNumController: authNumController,
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
      ),
    );
  }

  void _updateAuthNumValidation(bool isValid) {
    setState(() {
      _isAuthNumValid = isValid;
    });
  }
}