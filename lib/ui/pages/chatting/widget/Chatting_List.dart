import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/ui/pages/chatting/chat_name_set_page.dart';
import 'package:team3_kakao/ui/pages/chatting/chatting_list_page_view_model.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/chat_menu_modal.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/chat_person_count.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_profile.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';

class ChattingList extends ConsumerWidget {
  ChattingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ChattingPageModel? model = ref.watch(chattingPageProvider);

    if (model == null) {
      return SliverToBoxAdapter(child: CircularProgressIndicator());
    }

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ChattingItem(
              onlongPress: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: ((context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: basicColorW,
                      title:
                          Text("가라채팅", style: h3(fontWeight: FontWeight.bold)),
                      content: Container(
                        height: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ChatMenuModal(
                              ontap: () {
                                Navigator.pushNamed(
                                    context, Move.chatNameSetPage);
                              },
                              text: Text(
                                "채팅방 이름 설정",
                                style: h4(color: basicColorB3),
                              ),
                            ),
                            ChatMenuModal(
                              ontap: () {
                                showCustom(context, "즐겨찾기에 추가되었습니다.");
                              },
                              text: Text(
                                "즐겨찾기에 추가",
                                style: h4(color: basicColorB3),
                              ),
                            ),
                            ChatMenuModal(
                              ontap: () {},
                              text: Text(
                                "채팅방 상단 고정",
                                style: h4(color: basicColorB3),
                              ),
                            ),
                            ChatMenuModal(
                              ontap: () {
                                showCustom(context, "채팅방 알림이 설정되었습니다.");
                              },
                              text: Text(
                                "채팅방 알림 켜기",
                                style: h4(color: basicColorB3),
                              ),
                            ),
                            ChatMenuModal(
                              ontap: () {
                                _showdialog(context);
                              },
                              text: Text(
                                "나가기",
                                style: h4(color: basicColorB3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              },
              title: model!.chatRoomDTOList[index].chatName!,
              peopleCount: model!.chatRoomDTOList[index].peopleCount!,
              imagePath: "$baseUrl/images/${index + 1}.jpg",
              imageWidth: 40,
              imageHeight: 40,
              ontap: () {
                ref
                    .read(paramProvider)
                    .addChatRoomDocId(model!.chatRoomDTOList[index].chatDocId!);
                Navigator.pushNamed(context, Move.chatRoomPage);
              },
              circular: 16.0,
              subTitle: model!.chatRoomDTOList[index].lastChat,
              multiItem: Text("${model.chatRoomDTOList[index].lastChatTime}",
                  style: TextStyle(color: Colors.grey))),
          childCount: model!.chatRoomDTOList.length,
        ),
      ),
    );
  }

  showCustom(BuildContext context, String text) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            width: 280,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 8,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/kakao_logo.png",
                    fit: BoxFit.cover,
                    width: 30,
                    height: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ));
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 3),
        gravity: ToastGravity.BOTTOM);
  }

  Future<dynamic> _showdialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('채팅방 나가기', style: h3()),
        content: Container(
          height: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('나가기를 하면 대화내용이 모두 삭제되고', style: h5(color: basicColorB7)),
              Text('채팅목록에서도 삭제됩니다.', style: h5(color: basicColorB7)),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ChatMenuModal(
                ontap: () {
                  Navigator.of(context).pop();
                },
                text: Text(
                  "취소",
                  style: h4(color: pointColor04, fontWeight: FontWeight.bold),
                ),
              ),
              ChatMenuModal(
                ontap: () {
                  Navigator.of(context).pop();
                },
                text: Text(
                  "나가기",
                  style: h4(color: pointColor04, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
