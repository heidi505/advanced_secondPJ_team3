import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/_core/utils/validator_util.dart';

import '../../../widgets/login/login_button_form_field.dart';
import '../../../widgets/login/login_text_form_feild.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  // int _currentIndex = 0;
  // TabController? _tabController;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 4, vsync: this);
  }

  void _onTabbed(int index) {
    setState(() {
      // _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(mediumGap),
        child: ListView(
          children: [
            LoginTitle(text: "카카오톡을 시작합니다"),
            LoginTextFormField(
              text: "이메일 또는 전화번호",
              controller: _email,
              validator: validateEmail(),
            ),
            LoginTextFormField(
              text: "비밀번호",
              controller: _password,
              validator: validatePassword(),
            ),
            LoginButton(
              email: _email,
              password: _password,
              text: "로그인",
              formKey: _formKey,
            ),
            JoinButton(text: "새로운 카카오계정 만들기"),
            FindButton(account: "계정 찾기", password: "비밀번호 찾기"), //비번찾기 버튼
          ],
        ),
      ),
    ));
  }
}
