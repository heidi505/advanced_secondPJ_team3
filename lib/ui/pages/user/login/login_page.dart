import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/size.dart';

import '../../../widgets/login/login_button_form_field.dart';
import '../../../widgets/login/login_text_form_feild.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
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
      body: Padding(
        padding: const EdgeInsets.all(mediumGap),
        child: ListView(
          children: [
            LoginTitle(text: "카카오톡을 시작합니다"),
            LoginTextFormField(text: "이메일 또는 전화번호"),
            LoginTextFormField(text: "비밀번호"),
            LoginButton(text: "로그인"),
            JoinButton(text: "새로운 카카오계정 만들기"),
            FindButton(account: "계정 찾기", password: "비밀번호 찾기"),
          ],
        ),
      ),
    );
  }
}
