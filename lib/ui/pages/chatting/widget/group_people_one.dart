import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

class GroupPeopleOne extends StatelessWidget {


  const GroupPeopleOne({
    Key? key,
    required this.imagePath,
    required this.userId
  }) : super(key: key);

  final String imagePath;
  final int userId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                child: ProfileImage(
                  imagePath: "$baseUrl/images/$userId.jpg",
                  imageWidth: 45.0,
                  imageHeight: 45.0,
                  circular: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
