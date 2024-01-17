import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/ui/pages/my_info/my_info_phone_number_view_model.dart';

import '../../../_core/constants/color.dart';
import '../../../_core/constants/size.dart';

class MyInfoText extends StatelessWidget {
  final title;
  final text;
  final linkto;

  const MyInfoText({Key? key, this.title, this.text, this.linkto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: mediumGap, left: mediumGap),
      child: Row(
        children: [
          Text("$title"),
          Spacer(),
          Text("$text"),
        ],
      ),
    );
  }
}

class TextMenuCard extends ConsumerWidget {
  final String? title;
  final Widget? linkto;
  final String? icon;
  final Color? iconColor;
  final String? text;

  const TextMenuCard(
      {Key? key,
      this.title,
      this.linkto,
      this.icon,
      this.iconColor = Colors.grey,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(phoneNumUpdateProvider);
    final newState =
        ref.watch(phoneNumUpdateProvider.notifier).state?.dto.newPhoneNum;
    Logger().d("++state 값++: $newState");

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => linkto!),
        );
      },
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "$title",
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Row(
                children: [
                  Text(text!),
                  SizedBox(
                    width: 30,
                    height: 50,
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.angleRight,
                          color: basicColorB9),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => linkto!),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoTitle extends StatelessWidget {
  String text;

  InfoTitle({required this.text});

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

class InfoSubText extends StatelessWidget {
  String text;

  InfoSubText({required this.text});

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

class PasswordInsertText extends StatelessWidget {
  String text;

  PasswordInsertText({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "$text", hintStyle: TextStyle(color: basicColorB9)),
    );
  }
}

class InfoTextFormHint extends StatelessWidget {
  String text;

  InfoTextFormHint({required this.text});

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

class PhoneHintText extends StatelessWidget {
  String text;

  PhoneHintText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap),
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
