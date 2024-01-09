import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';

class ChatMenuIcon extends StatelessWidget {
  final String imagePath;
  final String text;
  final void Function()? onTap;

  ChatMenuIcon({
    required this.imagePath,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 60,
            height: 60,
          ),
          Text(
            text,
            style: h5(color: basicColorB7),
          ),
        ],
      ),
    );
  }
}
