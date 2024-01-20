import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/model/message.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/chat_notify/chat_notify_page.dart';

import 'package:team3_kakao/ui/pages/chat_room/chat_menu/chat_menu_media_page.dart';
import 'package:team3_kakao/ui/pages/chat_room/chat_menu/chat_menu_notice_page.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/chat_menu_main.dart';

import '../../../../_core/constants/size.dart';
import '../../../../data/dto/chat_dto/chatting_list_page_dto.dart';

class ChatRoomHamburger extends ConsumerWidget {
  List<MessageDTO>? messages;

  ChatRoomHamburger({super.key, this.messages});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser session = ref.read(sessionProvider);
    List<MiniDTO> sortedUserDTO = messages!.map((e) => MiniDTO(e)).toList();
    sortedUserDTO.removeWhere((a) =>
        a.userId == session.user!.id! ||
        a == sortedUserDTO.firstWhere((b) => b.userId == a.userId));

    List<MessageDTO> photoMessages = messages!
        .where((message) => message?.isPhoto == true)
        .map((message) => message!) // null이 아님이 보장되기 때문에 ! 연산자를 사용
        .toList();

    Logger().d("포토메세지 테스트중 ${photoMessages.length}");

    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoldTtitle(
                      text: "채팅방 서랍",
                    ),
                    SizedBox(
                      height: xsmallGap,
                    ),
                    ChatHamIcon(
                        text: "사진/동영상",
                        svg: "assets/icons/chat_pic_icon.svg",
                        linkto: ChatRoomMediaPage()),
                    // 실제 보유 이미지들 + 리스트로(?) 가져오게 수정해야함!
                    Container(
                      height: 50,
                      width: photoMessages.length * 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          String filePath =
                              photoMessages[index].content.split("'")[1];
                          return Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(File(filePath)),
                                      fit: BoxFit.contain)));
                        },
                        itemCount: photoMessages.length,
                      ),
                    ),
                    ChatHamIcon(
                        text: "파일",
                        svg: "assets/icons/chat_folder_icon.svg",
                        linkto: ChatRoomMediaPage()),
                    ChatHamIcon(
                        text: "링크",
                        svg: "assets/icons/chat_link_icon.svg",
                        linkto: ChatRoomMediaPage()),
                    BoldText(text: "톡캘린더"),
                    BoldText(text: "톡게시판"),
                    ChatHamIcon(
                        text: "공지",
                        svg: "assets/icons/chat_notice_icon.svg",
                        linkto: ChatNotifyPage()),
                    BoldText(text: "대화상대"),
                    // 프로필아이콘으로 추가 수정 해야함
                    PlusUser(
                        text: "대화상대 초대", svg: "assets/icons/invite_icon.svg"),
                    MyProfile(
                        text: session.user!.nickname!,
                        userId: session.user!.id!),
                    // 리스트로 쭉 나오게 해야함.
                    Container(
                      height: sortedUserDTO.length * 100,
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return UserList(
                                text: sortedUserDTO![index].userNickname!,
                                userId: sortedUserDTO![index].userId);
                          },
                          itemCount: sortedUserDTO.length),
                    )
                  ],
                ),
              ),
            ),
          ),
          HamBottomMenu()
        ],
      ),
    );
  }
}

class MiniDTO {
  String? userNickname;
  int? userId;

  MiniDTO(MessageDTO dto) {
    userId = dto.userId!;
    userNickname = dto.userNickname!;
  }
}
