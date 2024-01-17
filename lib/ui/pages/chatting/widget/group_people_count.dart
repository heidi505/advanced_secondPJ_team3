import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_people_many.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_people_one.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_people_three.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

import 'group_people_two.dart';

class GroupPeopleCount extends ConsumerStatefulWidget {
  const GroupPeopleCount({
    Key? key,
    required this.imagePath,
    required this.count,
    required this.userIdList
  }) : super(key: key);

  final String imagePath;
  final int count;
  final List<int> userIdList;

  @override
  _GroupPeopleCountState createState() => _GroupPeopleCountState();
}

class _GroupPeopleCountState extends ConsumerState<GroupPeopleCount> {

  @override
  Widget build(BuildContext context) {
    SessionUser session = ref.read(sessionProvider);
    List<int> sortedUserIdList = widget.userIdList.where((element) => element != session.user!.id).toList();
    if (widget.count > 4) {
      return GroupPeopleMany(userIdList: sortedUserIdList,imagePath: widget.imagePath);
    } else if (widget.count == 4) {
      return GroupPeopleThree(userIdList: sortedUserIdList,imagePath: widget.imagePath);
    } else if(widget.count == 3){
      return GroupPeopleTwo(userIdList: sortedUserIdList,imagePath: widget.imagePath);
    } else{
      return GroupPeopleOne(userId: sortedUserIdList[0],imagePath: widget.imagePath);
    }
  }
}
//총 2명일때