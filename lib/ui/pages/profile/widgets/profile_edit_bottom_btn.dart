import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';

class ProfileEditBottomIcon extends StatelessWidget {
  ProfileEditBottomIcon({
    this.ontap,
    required this.imagePath,
  });

  final void Function()? ontap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 28,
            height: 28,
          ),
        ],
      ),
    );
  }
}
