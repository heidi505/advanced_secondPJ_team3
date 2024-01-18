import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/Chatting_List.dart';
import 'package:team3_kakao/ui/pages/open_chatting/widgets/open_chatting_list.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';

class OnenChattingBody extends StatelessWidget {
  const OnenChattingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ChattingList(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: smallGap,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            height: 10,
            decoration: BoxDecoration(
              color: formColor.withOpacity(0.4),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: mediumGap,
          ),
        ),
        OpenChattingList(),
      ],
    );
  }
}
