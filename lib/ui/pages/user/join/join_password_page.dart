import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/user/join/join_form_view_model.dart';
import 'package:team3_kakao/ui/widgets/join/join_button_form_field.dart';
import 'package:team3_kakao/ui/widgets/join/join_text_form_field.dart';

import '../../../../_core/constants/size.dart';
import '../../../../data/model/user.dart';

class JoinPassWordPage extends ConsumerStatefulWidget {
  const JoinPassWordPage({super.key});

  @override
  _JoinPassWordPageState createState() => _JoinPassWordPageState();
}

class _JoinPassWordPageState extends ConsumerState<JoinPassWordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController authNumController = TextEditingController();
  bool _passwordsMatch = false;

  @override
  Widget build(BuildContext context) {
    JoinFormModel model = ref.read(joinFormProvider);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(mediumGap),
          child: ListView(
            children: [
              JoinTitle(text: "카카오계정 로그인에 사용할 \n비밀번호를 등록해 주세요."),
              TextFormHint(text: "카카오계정"),
              InfoText(text: model!.email),
              TextFormHint(text: "비밀번호"),
              InsertPassword(
                authNumController: authNumController,
                text: "비밀번호 입력 (8~32자리",
              ),
              InsertPassword2(
                onValidationChanged: _checkPassword,
              ),
              SubText(text: "· 비밀번호는 8~32자리의 영문 대소문자, 특수문자를 조합하여 설정해 주세요."),
              SubText(text: "· 다른 사이트에서 사용하는 것과 동일하거나 쉬운 비밀번호는 사용하지 마세요."),
              SubText(text: "· 안전한 계정 사용을 위해 비밀번호는 추가적으로 변경해 주세요.\n"),
              ProfilePageButton(
                controller: authNumController,
                text: "다음",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkPassword(bool isValid) {
    setState(() {
      _passwordsMatch = isValid;
    });
  }
}
