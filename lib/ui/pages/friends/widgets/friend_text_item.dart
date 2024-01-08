import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../_core/constants/size.dart';

class FriendTextItem extends StatelessWidget {
  String imagePath;
  String text;

  FriendTextItem({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SvgPicture.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: smallGap,
          ),
          Text(text),
        ],
      ),
    );
  }
}
