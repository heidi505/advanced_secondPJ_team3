import 'dart:ffi';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/chat_dto/chatting_list_page_dto.dart';
import 'package:team3_kakao/data/model/chat.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/chat_repository.dart';
import 'package:team3_kakao/main.dart';

import '../../../_core/constants/move.dart';
import '../../../data/dto/response_dto.dart';

class ChattingPageModel {
  List<ChatroomDTO> chatRoomDTOList;

  ChattingPageModel({required this.chatRoomDTOList});
}

class ChattingPageViewModel extends StateNotifier<ChattingPageModel?> {
  ChattingPageViewModel(this.ref, super._state);

  //유저 id는 세션에서 가져오면 됨
  Ref ref;
  final mContext = navigatorKey.currentContext;

  //채팅 리스트 페이지 노티파이이닛
  Future<void> notifyInit() async {
    SessionUser session = ref.read(sessionProvider);
    final db = FirebaseFirestore.instance;

    ChatRepository().fetchChatLists(session.user!.id!).listen((event) async {
      event.map((e) async {
        QuerySnapshot<Map<String, dynamic>> messages = await db
            .collection("ChatRoom1")
            .doc(e.chatDocId)
            .collection("messages")
            .orderBy("createdAt", descending: true)
            .limit(1)
            .get();

        if (messages.docs.isNotEmpty) {
          Map<String, dynamic> lastMessage = messages.docs.last.data();



          MessageDTO lastMessageDTO = MessageDTO(
              content: lastMessage["content"],
              createdAt: lastMessage["createdAt"],
              userId: lastMessage["userId"]);

          lastMessage["isPhoto"] ?
          e.lastChat = "사진"
              : e.lastChat = lastMessage["content"];

          int lastHour = lastMessageDTO.createdAt!.toDate().hour;
          int lastMinute = lastMessageDTO.createdAt!.toDate().minute;

          if (lastHour >= 12) {
            e.lastChatTime = "오후 " +
                (lastHour - 12).toString() +
                ":" +
                lastMinute.toString();
          } else {
            e.lastChatTime =
                "오전 " + lastHour.toString() + ":" + lastMinute.toString();
          }
        }
      }).toList();
      state = ChattingPageModel(chatRoomDTOList: event);
    }
    );


  }

  Future<void> changeChatName(
      String newChatName, String chatDocId, int userId) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    //userId, chatDocId 사용해서 동적으로 처리
    final chatRoom = await db.collection("ChatRoom1").doc(chatDocId);

    db.runTransaction((transaction) async {
      final snapshot = await transaction.get(chatRoom);
      transaction.update(chatRoom, {"chatName": newChatName});
    }).then((value) {
      print("변경 완료");

      for (var chatRoom in state!.chatRoomDTOList) {
        if (chatRoom.chatDocId == chatDocId) {
          chatRoom.chatName = newChatName;
        }
      }
      state = ChattingPageModel(chatRoomDTOList: state!.chatRoomDTOList);
    }, onError: (e) => print("변경 에러 $e"));
  }

  Future<void> chatSetting(String chatDocId, String func, int userId) async {
    await ChatRepository().setChatting(chatDocId, func, userId);
  }

  //채팅방 나가기
  Future<void> deleteChat(String chatDocId, int userId) async {
    await ChatRepository().deleteChat(chatDocId, userId);
    await notifyInit();
  }
}

final chattingPageProvider =
    StateNotifierProvider<ChattingPageViewModel, ChattingPageModel?>((ref) {
  return ChattingPageViewModel(ref, null)..notifyInit();
});
