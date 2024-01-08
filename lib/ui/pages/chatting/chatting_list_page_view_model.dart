import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/chat_dto/chatting_list_page_dto.dart';
import 'package:team3_kakao/data/model/chat.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/main.dart';

class ChattingPageModel{
 List<ChatroomDTO> chatRoomDTOList;

 ChattingPageModel({required this.chatRoomDTOList});
}





class ChattingPageViewModel extends StateNotifier<ChattingPageModel?>{
  //유저 id는 세션에서 가져오면 됨
  Ref ref;
  final mContext = navigatorKey.currentContext;

  ChattingPageViewModel(this.ref, super._state);

  Future<void> notifyInit() async {

    late FirebaseFirestore db = FirebaseFirestore.instance;
    //나중에 userId 넣든지 동적으로 처리해야함
    //쿼리 스냅샷은 컬렉션, 다큐먼트 스냅샷은 문서
    QuerySnapshot<Map<String, dynamic>> chatRoomCollection = await db.collection("ChatRoom1").get();

    Logger().d(chatRoomCollection.docs);


    List<ChatroomDTO> dtoList = [];

    //채팅방 for문 돌리기
    for(var chatDoc in chatRoomCollection.docs){
      dynamic data = chatDoc.data();

      String chatName = data["chatName"];
      int id = data["chatId"];
      List<dynamic> users = data["users"];

      //채팅방 내부 메시지들을 for문 돌려서 DTO에 담은 후, ChatRoomDTO에 담기
      QuerySnapshot<Map<String, dynamic>> messages = await db.collection("ChatRoom1").doc(chatDoc.id).collection("messages").get();

      List<MessageDTO> messageDTOList = [];
      for(var message in messages.docs){
        MessageDTO dto = MessageDTO(content: message["content"], createdAt: message["createdAt"], userId: message["userId"]);
        Logger().d(message["content"]);
        messageDTOList.add(dto);
      }

      int messageLength = messageDTOList.length;

      String? lastChat = messageDTOList[messageLength-1].content;

      //시간 파싱
      int lastHour = messageDTOList[messageLength-1].createdAt!.toDate().hour;
      String? lastchatTime = "";
      if(lastHour >= 12){
        lastchatTime = "오후 " + (lastHour - 12).toString() + ":" + messageDTOList[messageLength-1].createdAt!.toDate().minute.toString();
      }else{
        lastchatTime = "오전 " + lastHour.toString() + ":" + messageDTOList[messageLength-1].createdAt!.toDate().minute.toString();
      }



      ChatroomDTO dto = ChatroomDTO(chatName: chatName, chatId: id, peopleCount: users.length, messageList: messageDTOList, lastChat: lastChat, lastChatTime: lastchatTime);



      dtoList.add(dto);
    }

    state = ChattingPageModel(chatRoomDTOList: dtoList);

  }
}

final chattingPageProvider = StateNotifierProvider.autoDispose<ChattingPageViewModel, ChattingPageModel?>(
    (ref){
      return new ChattingPageViewModel(ref, null)..notifyInit();
    }
);