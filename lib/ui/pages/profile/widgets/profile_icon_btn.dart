import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';

class BottomIconButton extends StatelessWidget {
  const BottomIconButton({
    Key? key,
    required this.imagePath,
    required this.text,
    this.routeToNavigate,
  }) : super(key: key);

  final String imagePath;
  final String text;
  final String? routeToNavigate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeToNavigate!);
      },
      child: Column(
        children: [
          Image.asset(
            imagePath,
            color: basicColorW,
            fit: BoxFit.cover,
            width: 25,
            height: 25,
          ),
          const SizedBox(
            height: smallGap,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
