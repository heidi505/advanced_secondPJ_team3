import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/data/dto/user_requestDTO.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/main_page.dart';
import 'package:team3_kakao/ui/pages/user/join/join_check_page.dart';
import 'package:team3_kakao/ui/pages/user/join/join_form_view_model.dart';
import 'package:team3_kakao/ui/pages/user/join/join_password_page.dart';
import 'package:team3_kakao/ui/pages/user/join/join_profile_page.dart';
import 'package:team3_kakao/ui/pages/user/login/login_page.dart';

import '../../../_core/constants/color.dart';
import '../../../_core/constants/size.dart';
import '../../pages/user/join/join_welcome_page.dart';

class CheckPageButton extends StatelessWidget {
  String text;

  CheckPageButton({required this.text});

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

class PasswordPageButton extends StatefulWidget {
  final String text;
  final TextEditingController authNumController;
  final bool isAuthNumValid;

  PasswordPageButton({
    required this.text,
    required this.authNumController,
    required this.isAuthNumValid,
  });

  @override
  State<PasswordPageButton> createState() => _PasswordPageButtonState();
}

class _PasswordPageButtonState extends State<PasswordPageButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: TextButton(
            onPressed: widget.isAuthNumValid
                ? () {
                    int? verifyNumber =
                        int.tryParse(widget.authNumController.text);

                    MailCheckDTO mailCheckDTO =
                        MailCheckDTO(verifyNumber: verifyNumber!);
                    SessionUser user = ref.read(sessionProvider);
                    user.mailCheck(mailCheckDTO);
                  }
                : null,
            child: Text("${widget.text}"),
          ),
        );
      },
    );
  }
}

class ProfilePageButton extends ConsumerWidget {
  final TextEditingController controller;
  String text;

  ProfilePageButton({required this.text, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: TextButton(
          onPressed: () {
            ref.read(joinFormProvider).password = controller.text;
            Navigator.pushNamed(context, Move.joinProfilePage);
          },
          child: Text("$text")),
    );
  }
}

class WelcomePageButton extends ConsumerWidget {
  String text;
  final TextEditingController nickNameController;
  final TextEditingController phoneNumController;

  WelcomePageButton({
    required this.text,
    required this.nickNameController,
    required this.phoneNumController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    JoinFormModel? model = ref.watch(joinFormProvider);
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: TextButton(
        onPressed: () {
          SessionUser user = ref.read(sessionProvider);
          final email = ref.watch(joinFormProvider)?.email;
          final password = ref.watch(joinFormProvider)?.password;
          final birthdate = ref.watch(joinFormProvider)?.birthdate;
          //
          // final formattedBirthdate =
          //     DateFormat('yyyy-MM-dd').format(birthdate ?? DateTime.now());

          JoinReqDTO joinReqDTO = JoinReqDTO(
              email: email,
              password: password,
              nickname: nickNameController.text,
              phoneNum: phoneNumController.text,
              birthdate: birthdate);

          user.finalJoin(joinReqDTO);
        },
        child: Text("$text"),
      ),
    );
  }
}

class MainScreenButton extends StatelessWidget {
  String text;

  MainScreenButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: xmediumGap),
        child: TextButton(
            onPressed: () {
              // 버튼 클릭 시 join_agree_page.dart로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text("$text")),
      ),
    );
  }
}

class CheckErrorButton extends StatelessWidget {
  String text;

  CheckErrorButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: mediumGap, left: xsmallGap, bottom: mediumGap),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "$text",
          style: TextStyle(
              fontSize: smallGap, decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}

class RadioButtons extends StatefulWidget {
  @override
  _RadioButtonsState createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Radio(
              value: '남성',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              activeColor: primaryColor01,
            ),
            Text('남성'),
          ],
        ),
        Row(
          children: [
            Radio(
              value: '여성',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              activeColor: primaryColor01,
            ),
            Text('여성'),
          ],
        ),
        Row(
          children: [
            Radio(
              value: '선택안함',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              activeColor: primaryColor01,
            ),
            Text('선택안함'),
          ],
        ),
      ],
    );
  }
}
