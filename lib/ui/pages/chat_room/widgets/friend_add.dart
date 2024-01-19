import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/open_profile_image.dart';

class FriendAdd extends StatelessWidget {
  const FriendAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              child: OpenProfileImage(
                imagePath: "assets/images/basic_img.jpeg",
                imageWidth: 50,
                imageHeight: 50,
                circular: 20,
              ),
            ),
            Positioned(
              top: -2,
              right: -2,
              child: GestureDetector(
                onTap: () {
                  // 엑스 표시를 눌렀을 때 수행할 동작 추가
                },
                child: Container(
                  child: Image.asset(
                    "assets/icons/circle_close_icon.png",
                    fit: BoxFit.cover,
                    width: 20,
                    height: 20,
                    color: bgAndLineColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: xsmallGap,
        ),
        Text("그노"),
      ],
    );
  }
}
