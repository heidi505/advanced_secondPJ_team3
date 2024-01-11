import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../_core/constants/color.dart';
import '../../../_core/constants/size.dart';

class ChatHamIcon extends StatelessWidget {
  String text;
  String svg;

  ChatHamIcon({required this.text, required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: smallGap, bottom: smallGap),
      child: Row(
        children: [
          SvgPicture.asset(
            "$svg",
            height: mediumGap,
            width: mediumGap,
            color: basicColorB5,
          ),
          Text(" $text",
              style:
                  TextStyle(color: basicColorB3, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class BoldTtitle extends StatelessWidget {
  String text;

  BoldTtitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text("$text",
        style: TextStyle(fontSize: mediumGap, fontWeight: FontWeight.bold));
  }
}

class BoldText extends StatelessWidget {
  String text;

  BoldText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 1.0, color: formColor),
      )),
      child: Text("$text",
          style: TextStyle(fontSize: mediumGap, fontWeight: FontWeight.bold)),
    );
  }
}

class PlusUser extends StatelessWidget {
  String text;
  String svg;

  PlusUser({required this.text, required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: smallGap, bottom: smallGap),
      child: Row(
        children: [
          SvgPicture.asset(
            "$svg",
            height: 50,
            width: 50,
            color: pointColor04,
          ),
          Text(" $text",
              style:
              TextStyle(color: pointColor04, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  String text;
  String profilePic;

  MyProfile ({required this.text, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: smallGap),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(mediumGap),
                child: Image.asset(
                  "$profilePic",
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(width: smallGap),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: basicColorB5,
                ),
                child: Center(
                  child: Text(
                    '나',
                    style: TextStyle(
                      fontSize: smallGap,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: xsmallGap),
              Text("$text"),
            ],
          ),
        ),
      ],
    );
  }
}


class UserList extends StatelessWidget {
  String text;
  String profilePic;

  UserList ({required this.text, required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: smallGap),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(mediumGap),
                child: Image.asset(
                  "$profilePic",
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(width: smallGap),
              Text("$text"),
            ],
          ),
        ),
      ],
    );
  }
}
