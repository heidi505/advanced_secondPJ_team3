import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/_core/utils/date_format.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/open_profile_image.dart';

class OpenChatArea extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  final String text;
  final DateTime time;

  const OpenChatArea({
    super.key,
    required this.title,
    required this.subTitle,
    required this.text,
    required this.time,
    required this.imagePath,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OpenProfileImage(
                imagePath: imagePath,
                imageWidth: 50,
                imageHeight: 50,
                circular: 16),
            SizedBox(
              width: smallGap,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: pointColor03.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/fire_icon.png",
                                fit: BoxFit.cover,
                                width: 15,
                                height: 15,
                              ),
                              Text(
                                "Topic",
                                style: h6(
                                    color: pointColor03,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        title,
                        style: h4(color: basicColorB1),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        subTitle,
                        style: (h5(color: basicColorB9)),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            text,
                            style: h6(color: basicColorB5),
                          ),
                          SizedBox(
                            width: smallGap,
                          ),
                          Text(
                            getDifferenceFromNow(30),
                            style: h6(color: pointColor04),
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: bgAndLineColor.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Center(child: Text(" 참여")),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
