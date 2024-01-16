import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

class GroupPeopleThree extends StatelessWidget {
  const GroupPeopleThree({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: basicColorW,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ProfileImage(
                  imagePath: imagePath,
                  imageWidth: 26.0,
                  imageHeight: 26.0,
                  circular: 12.0,
                ),
              ),
            ),
          ),
          Positioned(
            right: 25,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: basicColorW,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ProfileImage(
                  imagePath: imagePath,
                  imageWidth: 26.0,
                  imageHeight: 26.0,
                  circular: 12.0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 9.0,
            top: -5,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: basicColorW,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ProfileImage(
                  imagePath: imagePath,
                  imageWidth: 26.0,
                  imageHeight: 26.0,
                  circular: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
