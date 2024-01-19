import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_people_count.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

class GroupProfile extends StatelessWidget {
  GroupProfile(
      {Key? key,
      this.title,
      required this.imagePath,
      this.subTitle,
      this.multiItem,
      this.peopleCount,
      this.ontap,
      this.chatDocId,
      this.onlongPress,
      this.userIdList})
      : super(key: key);

  List<int>? userIdList;
  String? chatDocId;
  final String? title;
  final String imagePath;
  final String? subTitle;
  final Widget? multiItem;
  String? peopleCount;
  final void Function()? ontap;
  final void Function()? onlongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onlongPress,
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
          margin: EdgeInsets.zero,
          color: Colors.transparent,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: GroupPeopleCount(
              userIdList: userIdList!,
              imagePath: imagePath,
              count: int.parse(peopleCount!),
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
                    style: subText(color: basicColorB7),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
      ),
    );
  }
}
