import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/Chatting_List.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';

class OnenChattingBody extends StatelessWidget {
  const OnenChattingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [ChattingList()],
    );
  }
}
