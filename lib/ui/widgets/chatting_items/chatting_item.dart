import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

class ChattingItem extends StatelessWidget {
  ChattingItem(
      {Key? key,
      required this.title,
      this.imagePath,
      this.subTitle,
      this.multiItem,
      required this.imageWidth,
      required this.imageHeight,
      required this.circular,
      this.peopleCount,
      this.ontap,
      this.chatDocId,
      this.onlongPress})
      : super(key: key);

  String? chatDocId;
  final String title;
  final String? imagePath;
  final String? subTitle;
  final Widget? multiItem;
  final double imageWidth;
  final double imageHeight;
  final double circular;
  String? peopleCount;
  final void Function()? ontap;
  final void Function()? onlongPress;

  @override
  Widget build(BuildContext context) {
    if (peopleCount == null) {
      peopleCount = "";
    }

    return GestureDetector(
      onLongPress: onlongPress,
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.zero,
        color: Colors.transparent,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: ProfileImage(
            circular: circular,
            imagePath: imagePath!,
            imageWidth: imageWidth,
            imageHeight: imageHeight,
          ),
          title: Container(
            child: Row(
              children: [
                Text("$title", style: TextStyle(color: Colors.black)),
                SizedBox(width: 7),
                Text(
                  peopleCount!,
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
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
