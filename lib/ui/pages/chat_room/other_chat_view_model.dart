import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/chat_repository.dart';
import 'package:team3_kakao/main.dart';
import 'package:team3_kakao/ui/pages/chat_room/chat_room_page.dart';
import 'package:team3_kakao/ui/pages/chatting/chatting_list_page_view_model.dart';

import '../../../_core/constants/move.dart';
import '../../../data/dto/chat_dto/chatting_list_page_dto.dart';
import '../../../data/dto/friend_dto/chat_users_dto.dart';

class OtherChatModel {
  List<MessageDTO> messages;
  OtherChatModel({required this.messages});
}

class OtherChatViewModel extends StateNotifier<OtherChatModel?> {
  OtherChatViewModel(this.ref, super._state);
  final mContext = navigatorKey.currentContext;
  Ref ref;

  // Future<void> notifyInit() async {
  //   Logger().d("여기 뷰모델은 되나?");
  //   ParamStore paramStore = ref.read(paramProvider);
  //   SessionUser session = ref.read(sessionProvider);
  //
  //   Logger().d(paramStore.chatRoomDocId ?? "없음");
  //
  //   List<MessageDTO> messageList = await ChatRepository()
  //       .getInitMessages(paramStore.chatRoomDocId!, session.user!.id!);
  //
  //   List<int?> userIdList = messageList.map((e) => e.userId).toSet().toList();
  //
  //   ResponseDTO responseDTO =
  //       await ChatRepository().getChatUsers(userIdList, session.user!.jwt!);
  //   List<ChatUsersDTO> dtoList = responseDTO.data;
  //   print('dtoList : ${dtoList.toString()}');
  //
  //   for (MessageDTO message in messageList) {
  //     for (ChatUsersDTO dto in dtoList) {
  //       Logger().d("로그1");
  //       if (message.userId == dto.userId) {
  //         Logger().d("로그2");
  //         //
  //         message.userNickname = dto.userNickname;
  //         print("message.userNickname :  ${message.userNickname}");
  //         Logger().d(message.userNickname);
  //       }
  //     }
  //   }
  //   state = OtherChatModel(messages: messageList);
  // }

  //addmessage 하면 fetchMessages를 발동시켜야하나... 근데 그러면 ListGenerate때메 또 추가되는거 아닌가...ㅜ ㅜㅜㅜㅜㅜㅜㅜㅜ
  //점점 연산자 하나 더 가능한듯?
  //새로운 메세지만 추가시켜야하는건가...
  Future<void> fetchMessages() async {
    ParamStore paramStore = ref.read(paramProvider);
    SessionUser session = ref.read(sessionProvider);

    ChatRepository()
        .fetchMessages(paramStore.chatRoomDocId!, session.user!.id!)
        .listen((event) async {
      List<int?> userIdList = event.map((e) => e.userId).toSet().toList();

      ResponseDTO responseDTO =
          await ChatRepository().getChatUsers(userIdList, session.user!.jwt!);
      List<ChatUsersDTO> dtoList = responseDTO.data;

      for (MessageDTO message in event) {
        for (ChatUsersDTO dto in dtoList) {
          Logger().d("로그1");
          if (message.userId == dto.userId) {
            Logger().d("로그2");
            //
            message.userNickname = dto.userNickname;
            print("message.userNickname :  ${message.userNickname}");
            Logger().d(message.userNickname);
          }
        }
      }
      state = OtherChatModel(messages: event);
    });
  }

  Future<void> addMessage(String text) async {
    SessionUser session = ref.read(sessionProvider);
    ParamStore paramStore = ref.read(paramProvider);
    await ChatRepository()
        .addMessage(text, session.user!.id!, paramStore.chatRoomDocId!);
  }

  Future<void> addPhoto(String text) async {
    SessionUser session = ref.read(sessionProvider);
    ParamStore paramStore = ref.read(paramProvider);
    await ChatRepository()
        .addPhoto(text, session.user!.id!, paramStore.chatRoomDocId!, true);
  }

  Future<void> getOneToOneChat() async {
    final mContext = navigatorKey.currentContext;

    SessionUser session = ref.read(sessionProvider);
    ParamStore paramStore = ref.read(paramProvider);

    final db = FirebaseFirestore.instance;

    QuerySnapshot<Map<String, dynamic>> oldChatDoc = await db
        .collection("ChatRoom1")
        .where("users",
            isEqualTo: [session.user!.id, paramStore.friendDTO!.userId]).get();

    if (oldChatDoc.size == 0) {
      DocumentReference<Map<String, dynamic>> newChatDoc =
          await ChatRepository()
              .insertOneToOneChat(session.user!, paramStore.friendDTO!);

      ChatroomDTO chatroomDTO = ChatroomDTO(
          chatName:
              "${session.user!.nickname!}, ${paramStore.friendDTO!.nickname}",
          chatDocId: newChatDoc.id,
          peopleCount: "2");

      paramStore.addChatRoomDocId(newChatDoc.id);
      paramStore.addChatRoomDTO(chatroomDTO);


      Navigator.push(
          mContext!, MaterialPageRoute(builder: (context) => ChatRoomPage()));
    } else {
      for (var chatDoc in oldChatDoc.docs) {
        ref.read(paramProvider).addChatRoomDocId(chatDoc.id);
        List<dynamic> users = chatDoc["users"];
        ChatroomDTO chatroomDTO = ChatroomDTO(
            chatName: chatDoc["chatName"],
            chatDocId: chatDoc.id,
            peopleCount: users.length.toString());
        ref.read(paramProvider).addChatRoomDTO(chatroomDTO);
        Navigator.push(
            mContext!, MaterialPageRoute(builder: (context) => ChatRoomPage()));
      }
    }
  }
}

final otherChatProvider =
    StateNotifierProvider<OtherChatViewModel, OtherChatModel?>((ref) {
  return OtherChatViewModel(ref, null);
});
