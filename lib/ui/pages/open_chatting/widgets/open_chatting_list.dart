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
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/chat_dto/chatting_list_page_dto.dart';
import 'package:team3_kakao/data/model/user_mock.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/chatting/chatting_list_page_view_model.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/chat_menu_modal.dart';
import 'package:team3_kakao/ui/pages/open_chatting/widgets/open_chat_area.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/open_profile_image.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

class OpenChattingList extends ConsumerWidget {
  OpenChattingList({super.key});

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
          (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "라이프 채팅방",
                  style: h3(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: smallGap,
              ),
              OpenChatArea(
                title: "오늘 먹은 음식, 먹픈 채팅방",
                subTitle: "#오픈 토픽 #라이프 토픽 #음식 사진",
                text: "16명 참여중",
                time: DateTime.now(),
              ),
            ],
          ),
          childCount: model!.chatRoomDTOList.length,
        ),
      ),
    );
  }

  AlertDialog _ChatMenuModal(
      BuildContext context, ChatroomDTO chatroomDTO, WidgetRef ref) {
    SessionUser session = ref.read(sessionProvider);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: basicColorW,
      title:
          Text(chatroomDTO.chatName!, style: h3(fontWeight: FontWeight.bold)),
      content: Container(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChatMenuModalBox(
              ontap: () {
                Navigator.pushNamed(context, Move.chatNameSetPage);
              },
              text: Text(
                "채팅방 이름 설정",
                style: h4(color: basicColorB3),
              ),
            ),
            ChatMenuModalBox(
              ontap: () {
                ref.read(chattingPageProvider.notifier).chatSetting(
                    chatroomDTO.chatDocId!, "isBookMarked", session.user!.id!);
                showCustom(context, "즐겨찾기에 추가되었습니다.");
              },
              text: Text(
                "즐겨찾기에 추가",
                style: h4(color: basicColorB3),
              ),
            ),
            ChatMenuModalBox(
              ontap: () {
                ref.read(chattingPageProvider.notifier).chatSetting(
                    chatroomDTO.chatDocId!, "isFixed", session.user!.id!);
                showCustom(context, "${chatroomDTO.chatName} 상단 고정");
              },
              text: Text(
                "채팅방 상단 고정",
                style: h4(color: basicColorB3),
              ),
            ),
            ChatMenuModalBox(
              ontap: () {
                ref.read(chattingPageProvider.notifier).chatSetting(
                    chatroomDTO.chatDocId!, "IsAlarmOn", session.user!.id!);
                showCustom(context, "채팅방 알림이 설정되었습니다.");
              },
              text: Text(
                "채팅방 알림 켜기",
                style: h4(color: basicColorB3),
              ),
            ),
            ChatMenuModalBox(
              ontap: () {
                _showdialog(context, chatroomDTO, session, ref);
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

  Future<dynamic> _showdialog(BuildContext context, ChatroomDTO chatroomDTO,
      SessionUser session, WidgetRef ref) {
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
              ChatMenuModalBox(
                ontap: () {
                  Navigator.of(context).pop();
                },
                text: Text(
                  "취소",
                  style: h4(color: pointColor04, fontWeight: FontWeight.bold),
                ),
              ),
              ChatMenuModalBox(
                ontap: () {
                  ref
                      .read(chattingPageProvider.notifier)
                      .deleteChat(chatroomDTO.chatDocId!, session.user!.id!);
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
