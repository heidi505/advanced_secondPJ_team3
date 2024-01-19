import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/friend_dto/chat_users_dto.dart';
import 'package:team3_kakao/data/model/message.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
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
    ParamStore paramStore = ref.read(paramProvider);

    List<ChatUsersDTO> users = paramStore.chatUsers!;

    List<int?> userIdList = users.map((e) => e.userId).toSet().toList()..removeWhere((a) => a == session.user!.id!);
    List<String?> userNickname= users.map((e) => e.userNickname).toSet().toList()..removeWhere((a) => a == session.user!.nickname);

    Logger().d(userIdList.length);

    Map<String, dynamic> chatUsers = {
      "userIdList" : userIdList,
      "userNicknameList" : userNickname
    };



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
                      height: 90,
                      child: Row(
                        children: [
                          Image.asset("assets/images/cat.jpg",
                              fit: BoxFit.cover, height: 70, width: 70),
                          SizedBox(width: xsmallGap), // 여백을 추가하는 부분
                          Image.asset("assets/images/dog.jpg",
                              fit: BoxFit.cover, height: 70, width: 70),
                        ],
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
                        text: "공지", svg: "assets/icons/chat_notice_icon.svg", linkto: ChatNotifyPage()),
                    BoldText(text: "대화상대"),
                    // 프로필아이콘으로 추가 수정 해야함
                    PlusUser(
                        text: "대화상대 초대", svg: "assets/icons/invite_icon.svg"),
                    MyProfile(
                        text: session.user!.nickname!,
                        userId: session.user!.id!),
                    // 리스트로 쭉 나오게 해야함.
                    Container(
                      height: userIdList.length * 100,
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return UserList(
                                text: chatUsers["userNicknameList"][index],
                                userId: chatUsers["userIdList"][index]);
                          },
                          itemCount: userIdList.length),
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
