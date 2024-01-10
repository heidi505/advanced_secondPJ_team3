import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/size.dart';


import '../../pages/user/join/join_check_page.dart';
import '../join/join_button_form_field.dart';

class LoginTextFormField extends StatelessWidget {
  String text;

  LoginTextFormField({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: xsmallGap, bottom: mediumGap),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "$text",
            ),
          ),
        ),
      ],
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
