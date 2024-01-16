import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_people_many.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_people_three.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

import 'group_people_two.dart';

class GroupPeopleCount extends StatelessWidget {
  const GroupPeopleCount({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GroupPeopleTwo(imagePath: imagePath);
  }
}
