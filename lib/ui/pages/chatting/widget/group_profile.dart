import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

class GroupProfile extends StatelessWidget {
  const GroupProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          runAlignment: WrapAlignment.center,
          verticalDirection: VerticalDirection.down,
          direction: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ProfileImage(imagePath:"assets/images/basic_img.jpeg", imageWidth: 20.0, imageHeight: 20.0, circular: 16.0),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ProfileImage(imagePath:"assets/images/basic_img.jpeg", imageWidth: 20.0, imageHeight: 20.0, circular: 16.0),
            ),
        ],),
        Wrap(
          runAlignment: WrapAlignment.center,
          verticalDirection: VerticalDirection.down,
          direction: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ProfileImage(imagePath:"assets/images/basic_img.jpeg", imageWidth: 20.0, imageHeight: 20.0, circular: 16.0),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ProfileImage(imagePath:"assets/images/basic_img.jpeg", imageWidth: 20.0, imageHeight: 20.0, circular: 16.0),
            ),

        ],),
      ],
    );
  }
}
