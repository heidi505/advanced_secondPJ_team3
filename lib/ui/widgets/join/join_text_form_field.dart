import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/user_requestDTO.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/user/join/join_form_view_model.dart';

import '../../../_core/constants/color.dart';
import '../../../_core/constants/size.dart';
import '../../../_core/utils/validator_util.dart';

class JoinTitle extends StatelessWidget {
  String text;

  JoinTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: mediumGap, left: xsmallGap, bottom: mediumGap),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "$text",
          style: TextStyle(fontSize: mediumGap),
        ),
      ),
    );
  }
}

class CheckErrorText extends StatelessWidget {
  String text;

  CheckErrorText({required this.text});

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

class SubText extends StatelessWidget {
  String text;

  SubText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: smallGap),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "$text",
          style: TextStyle(fontSize: smallGap, color: basicColorB7),
        ),
      ),
    );
  }
}

class TextFormHint extends StatelessWidget {
  String text;

  TextFormHint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: smallGap),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "$text",
          style: TextStyle(fontSize: smallGap, color: basicColorB7),
        ),
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  String text;

  InfoText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: smallGap),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "$text",
          style: TextStyle(color: basicColorB7),
        ),
      ),
    );
  }
}

class CheckEmail extends StatefulWidget {
  @override
  _CheckEmailState createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  TextEditingController _emailController = TextEditingController();

  String? _emailErrorText;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "이메일을 입력해주세요",
                      hintStyle: TextStyle(color: basicColorB9),
                      errorText: _emailErrorText,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _emailErrorText = validateEmail()(value);
                        ref.read(joinFormProvider.notifier).setEmail(value);
                        Logger().d(_emailController);
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: basicColorW,
                    side: BorderSide(color: primaryColor01),
                  ),
                  onPressed: () {
                    if (_emailErrorText == null) {
                      MailSendDTO mailSendDTO =
                          new MailSendDTO(email: _emailController.text);
                      SessionUser user = ref.read(sessionProvider);
                      user.mailSend(mailSendDTO);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('인증메일을 발송했습니다.'),
                        ),
                      );
                    }
                  },
                  child: Text('인증메일 발송', style: TextStyle(color: basicColorB1)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}

class InsertText2 extends StatelessWidget {
  String text;

  InsertText2({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "$text", hintStyle: TextStyle(color: basicColorB9)),
    );
  }
}

class AuthNum extends StatefulWidget {
  final Function(bool isValid) onValidationChanged;
  final TextEditingController authNumController;

  AuthNum({required this.onValidationChanged, required this.authNumController});

  @override
  State<AuthNum> createState() => _AuthNumState();
}

class _AuthNumState extends State<AuthNum> {
  bool _isAuthNumValid = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Column(
          children: [
            TextFormField(
              controller: widget.authNumController,
              decoration: InputDecoration(
                hintText: "인증번호 입력",
                errorText: _isAuthNumValid ? null : "인증번호를 입력해주세요.",
              ),
              onChanged: (value) {
                setState(() {
                  int? verifyNumber =
                      int.tryParse(widget.authNumController.text);
                  Logger().d(verifyNumber);
                  Logger().d(widget.authNumController.text + "야야야야야야양야ㄷㄱ");
                  Logger().d(
                      "_authNumController.text: ${widget.authNumController.text}");
                  Logger().d(
                      "_authNumController.text runtimeType: ${widget.authNumController.text.runtimeType}");

                  ref
                      .read(joinFormProvider.notifier)
                      .setVerifyNumber(verifyNumber!);
                  _isAuthNumValid = value.isNotEmpty;
                  widget.onValidationChanged(_isAuthNumValid);
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    widget.authNumController?.dispose();
    super.dispose();
  }
}

class InsertNickName extends ConsumerWidget {
  String text;
  final TextEditingController nickNameController;
  InsertNickName({required this.nickNameController, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: nickNameController,
      onChanged: (value) {
        ref.read(joinFormProvider.notifier).setNickName(value);
        Logger().d(nickNameController.text);
      },
      decoration: InputDecoration(
          hintText: "$text", hintStyle: TextStyle(color: basicColorB9)),
    );
  }
}

class InsertBirthday extends ConsumerWidget {
  String text;
  final TextEditingController birthDateController;

  InsertBirthday({required this.birthDateController, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: birthDateController,
      onChanged: (value) {
        Logger().d(birthDateController.text);
        DateTime? selectedDate = DateTime.tryParse(value);
        if (selectedDate != null) {
          ref.read(joinFormProvider.notifier).setBirthDate(selectedDate);
        }
      },
      decoration: InputDecoration(
          hintText: "$text", hintStyle: TextStyle(color: basicColorB9)),
    );
  }
}

class InsertPhoneNum extends ConsumerWidget {
  String text;
  final TextEditingController phoneNumController;

  InsertPhoneNum({required this.phoneNumController, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: phoneNumController,
      onChanged: (value) {
        Logger().d(phoneNumController.text);
        ref.read(joinFormProvider.notifier).setPhoneNum(value);
        Logger().d(value);
      },
      decoration: InputDecoration(
          hintText: "$text", hintStyle: TextStyle(color: basicColorB9)),
    );
  }
}

class InsertPassword extends ConsumerWidget {
  final TextEditingController? authNumController;
  String text;
  InsertPassword({required this.text, this.authNumController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: authNumController,
      onChanged: (value) {
        ref.read(joinFormProvider.notifier).setPassword(value);
      },
      decoration: InputDecoration(
        hintText: "$text",
        hintStyle: TextStyle(color: basicColorB9),
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '비밀번호를 입력하세요.';
        }
        return null;
      },
    );
  }
}

class InsertPassword2 extends StatefulWidget {
  final Function(bool isValid) onValidationChanged;
  final TextEditingController? authNumController;
  InsertPassword2({required this.onValidationChanged, this.authNumController});

  @override
  State<InsertPassword2> createState() => _InsertPassword2State();
}

class _InsertPassword2State extends State<InsertPassword2> {
  bool _passwordsMatch = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return TextFormField(
          controller: widget.authNumController,
          decoration: InputDecoration(
            hintText: "비밀번호 재입력",
            hintStyle: TextStyle(color: basicColorB9),
            errorText: _passwordsMatch ? null : '비밀번호를 입력해 주세요',
          ),
          obscureText: true,
          onChanged: (value) {
            setState(() {
              _passwordsMatch = value.isNotEmpty;
              widget.onValidationChanged(_passwordsMatch);
              ref.read(joinFormProvider.notifier).setPassword(value);
            });
          },
        );
      },
    );
  }

  @override
  void dispose() {
    widget.authNumController!.dispose();
    super.dispose();
  }
}

class WelcomeTitle extends StatelessWidget {
  String text;

  WelcomeTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: xlargeGap, left: xsmallGap, bottom: mediumGap),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "$text",
          style: TextStyle(fontSize: xmediumGap, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  String text;

  WelcomeText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "$text",
          style: TextStyle(color: basicColorB7),
        ),
      ),
    );
  }
}

class WelcomeText2 extends StatelessWidget {
  String text;

  WelcomeText2({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap),
      child: Align(
        alignment: Alignment.center,
        child: Text("$text", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class WelcomeText3 extends StatelessWidget {
  String text;

  WelcomeText3({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap),
      child: Align(
        alignment: Alignment.center,
        child: Text("$text", style: TextStyle(fontWeight: FontWeight.w500)),
      ),
    );
  }
}
