import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../_core/constants/color.dart';
import '../../../_core/constants/size.dart';

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

class InsertText extends StatelessWidget {
  String text;

  InsertText({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "$text", hintStyle: TextStyle(color: basicColorB9)),
    );
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
        child: Text(
          "$text",
            style: TextStyle(fontWeight: FontWeight.bold)
        ),
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
        child: Text(
            "$text",
            style: TextStyle(fontWeight: FontWeight.w500)
        ),
      ),
    );
  }
}