import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/ui/pages/chatting/chatting_list_page_view_model.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/chat_person_count.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_profile.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';

class ChattingList extends ConsumerWidget {
  ChattingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChattingPageModel? model = ref.watch(chattingPageProvider);

    if(model == null){
      return SliverToBoxAdapter(child: CircularProgressIndicator());
    }



    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) =>
              ChattingItem(
                  title: model!.chatRoomDTOList[index].chatName!,
                  peopleCount: model!.chatRoomDTOList[index].peopleCount!,
                  imagePath: baseUrl + "/images/${index+1}.jpg",
                  imageWidth: 40,
                  imageHeight: 40,
                  ontap: () {
                    Navigator.pushNamed(context, Move.chatRoomPage);
                  },
                  circular: 16.0,
                  subTitle: model!.chatRoomDTOList[index].lastChat,
                  multiItem: Text(
                      "${model.chatRoomDTOList[index].lastChatTime}", style: TextStyle(color: Colors.grey))),
          childCount: model!.chatRoomDTOList.length,
        ),
      ),
    );
  }
}