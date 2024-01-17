import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

import '../../../../_core/constants/http.dart';

class GroupPeopleMany extends StatelessWidget {
  const GroupPeopleMany({
    super.key,
    required this.imagePath,
    required this.userIdList
  });

  final String imagePath;
  final List<int> userIdList;

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
              child: ProfileImage(
                  imagePath: "$baseUrl/images/${userIdList[0]}.jpg",
                  imageWidth: 20.0,
                  imageHeight: 20.0,
                  circular: 8.0),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ProfileImage(
                  imagePath: "$baseUrl/images/${userIdList[1]}.jpg",
                  imageWidth: 20.0,
                  imageHeight: 20.0,
                  circular: 8.0),
            ),
          ],
        ),
        Wrap(
          runAlignment: WrapAlignment.center,
          verticalDirection: VerticalDirection.down,
          direction: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ProfileImage(
                  imagePath: "$baseUrl/images/${userIdList[2]}.jpg",
                  imageWidth: 20.0,
                  imageHeight: 20.0,
                  circular: 8.0),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ProfileImage(
                  imagePath: "$baseUrl/images/${userIdList[3]}.jpg",
                  imageWidth: 20.0,
                  imageHeight: 20.0,
                  circular: 8.0),
            ),
          ],
        ),
      ],
    );
  }
}
