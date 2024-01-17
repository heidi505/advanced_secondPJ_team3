import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_people_many.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_people_three.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

import 'group_people_two.dart';

class GroupPeopleCount extends StatefulWidget {
  const GroupPeopleCount({
    Key? key,
    required this.imagePath,
    required this.count,
  }) : super(key: key);

  final String imagePath;
  final int count;

  @override
  State<GroupPeopleCount> createState() => _GroupPeopleCountState();
}

class _GroupPeopleCountState extends State<GroupPeopleCount> {
  @override
  Widget build(BuildContext context) {
    if (widget.count >= 4) {
      return GroupPeopleMany(imagePath: widget.imagePath);
    } else if (widget.count == 3) {
      return GroupPeopleThree(imagePath: widget.imagePath);
    } else {
      return GroupPeopleTwo(imagePath: widget.imagePath);
    }
  }
}
