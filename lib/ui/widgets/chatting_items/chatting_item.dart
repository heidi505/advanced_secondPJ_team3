import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

class ChattingItem extends StatelessWidget {
  const ChattingItem({
    Key? key,
    required this.title,
    required this.imagePath,
    this.subTitle,
    this.multiItem,
    required this.imageWidth,
    required this.imageHeight,
    required this.circular,
  }) : super(key: key);

  final String title;
  final String imagePath;
  final String? subTitle;
  final Widget? multiItem;
  final double imageWidth;
  final double imageHeight;
  final double circular;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.zero,
        color: Colors.transparent,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: ProfileImage(
            circular: circular,
            imagePath: imagePath,
            imageWidth: imageWidth,
            imageHeight: imageHeight,
          ),
          title: Text(title),
          subtitle: subTitle != null
              ? Text(
                  subTitle!,
                  style: subText(color: basicColorB9), // Corrected placement
                )
              : null,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (multiItem != null) multiItem!,
            ],
          ),
          isThreeLine: subTitle != null,
        ),
      ),
    );
  }
}
