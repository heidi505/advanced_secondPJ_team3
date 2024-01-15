import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';

class ProfileTextArea extends StatelessWidget {
  const ProfileTextArea({
    Key? key,
    required this.textWidget,
  }) : super(key: key);

  final Widget textWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: basicColorW.withOpacity(0.4),
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textWidget,
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: Image.asset(
                "assets/icons/profile/profile_icon_02.png",
                fit: BoxFit.cover,
                width: 20,
                height: 20,
                color: basicColorW,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
