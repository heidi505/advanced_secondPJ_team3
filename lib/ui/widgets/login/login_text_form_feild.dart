import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/user_requestDTO.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';

import '../../pages/user/join/join_check_page.dart';
import '../join/join_button_form_field.dart';

class LoginTextFormField extends ConsumerWidget {
  final TextEditingController controller;
  final validator;
  String text;

  LoginTextFormField(
      {required this.text, required this.controller, required this.validator});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: xsmallGap, bottom: mediumGap),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "$text",
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}

class LoginButton extends ConsumerWidget {
  dynamic? formKey;
  String? text;
  TextEditingController? email;
  TextEditingController? password;
  LoginButton(
      {super.key, required this.text, this.email, this.password, this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: TextButton(
          onPressed: () {
            Logger().d("버튼 눌러짐");
            if (formKey.currentState!.validate()) {
              Logger().d("유효성 통과");
              LoginReqDTO loginReqDTO =
                  new LoginReqDTO(email: email!.text, password: password!.text);
              SessionUser user = ref.read(sessionProvider);
              user.login(loginReqDTO);
            }
          },
          child: Text("$text")),
    );
  }
}

class JoinButton extends StatelessWidget {
  String text;
  JoinButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: TextButton(
          onPressed: () {
            // 버튼 클릭 시 join_agree_page.dart로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JoinCheckPage()),
            );
          },
          child: Text("$text")),
    );
  }
}

class LoginTitle extends StatelessWidget {
  String text;

  LoginTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(largeGap),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "$text",
          style: TextStyle(fontSize: mediumGap),
        ),
      ),
    );
  }
}
