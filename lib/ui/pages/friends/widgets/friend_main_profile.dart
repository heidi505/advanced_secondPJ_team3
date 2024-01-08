import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/size.dart';

class FriendMainProfile extends StatelessWidget {
  const FriendMainProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: InkWell(
      onTap: () {},
      child: Container(
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 8.0),
        child: Row(
          children: [
            ClipRRect(
              child: Image.asset(
                "assets/images/basic_img.jpeg",
                fit: BoxFit.cover,
                width: 60,
                height: 60,
              ),
              borderRadius: BorderRadius.circular(24.0),
            ),
            SizedBox(
              width: mediumGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "김하얀",
                  style: h4(),
                ),
                Text(
                  "상태메시지",
                  style: h6(color: basicColorB9),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
