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

    SessionUser session = ref.read(sessionProvider);

    final FirebaseFirestore db = FirebaseFirestore.instance;
    //나중에 userId 넣든지 동적으로 처리해야함
    //쿼리 스냅샷은 컬렉션, 다큐먼트 스냅샷은 문서
    QuerySnapshot<Map<String, dynamic>> chatRoomCollection = await db.collection("ChatRoom1").where("users", arrayContains: session.user!.id).get();

    //채팅방 for문 돌리기
    List<ChatroomDTO> dtoList = [];
    //컬렉션 내의 문서 for문 돌면서 하나하나 list에 넣어줌
    for(var chatDoc in chatRoomCollection.docs){
      dynamic data = chatDoc.data();

      if(data["chatName"] == "나와의 채팅"){
        chatRoomCollection.docs.remove(chatDoc);
      }

      String chatName = data["chatName"];
      List<dynamic> users = data["users"];


      //채팅방 내부 메시지들을 for문 돌려서 DTO에 담은 후, ChatRoomDTO에 담기
      QuerySnapshot<Map<String, dynamic>> messages = await db.collection("ChatRoom1").doc(chatDoc.id).collection("messages").get();
      List<MessageDTO> messageDTOList = [];
      for(var message in messages.docs){
        MessageDTO dto = MessageDTO(content: message["content"], createdAt: message["createdAt"], userId: message["userId"], messageDocId: message.id);
        messageDTOList.add(dto);
      }



      //lastchat 세팅
      int messageLength = messageDTOList.length;
      String? lastChat = messageDTOList[messageLength-1].content;

      //시간 파싱
      int lastHour = messageDTOList[messageLength-1].createdAt!.toDate().hour;
      Logger().d(messageDTOList[messageLength-1].createdAt!.toDate());
      String? lastchatTime = "";
      if(lastHour >= 12){
        lastchatTime = "오후 " + (lastHour - 12).toString() + ":" + messageDTOList[messageLength-1].createdAt!.toDate().minute.toString();
      }else{
        lastchatTime = "오전 " + lastHour.toString() + ":" + messageDTOList[messageLength-1].createdAt!.toDate().minute.toString();
      }



      ChatroomDTO dto = ChatroomDTO(chatName: chatName, peopleCount: users.length.toString(), messageList: messageDTOList, lastChat: lastChat, lastChatTime: lastchatTime,chatDocId: chatDoc.id);

      dtoList.add(dto);
    }

    Logger().d(dtoList);

    state = ChattingPageModel(chatRoomDTOList: dtoList);

  }


  Future<void> changeChatName(String newChatName, String chatDocId, int userId) async{

    FirebaseFirestore db = FirebaseFirestore.instance;

    //userId, chatDocId 사용해서 동적으로 처리
    final chatRoom = await db.collection("ChatRoom1").doc(chatDocId);

    db.runTransaction((transaction) async{
      final snapshot = await transaction.get(chatRoom);
      transaction.update(chatRoom, {"chatName" : newChatName});
    })
        .then((value) {
          print("변경 완료");

          for(var chatRoom in state!.chatRoomDTOList){
            if(chatRoom.chatDocId == chatDocId){
              chatRoom.chatName = newChatName;
            }
          }
          state = ChattingPageModel(chatRoomDTOList: state!.chatRoomDTOList);
          },
        onError: (e)=> print("변경 에러 $e"));
  }

  Future<void> chatSetting(String chatDocId, String func, int userId) async{
    await ChatRepository().setChatting(chatDocId, func, userId);

  }

  //채팅방 나가기
  Future<void> deleteChat(String chatDocId, int userId) async {
    await ChatRepository().deleteChat(chatDocId, userId);
    await notifyInit();


  }


}

final chattingPageProvider = StateNotifierProvider<ChattingPageViewModel, ChattingPageModel?>(
    (ref){
      return ChattingPageViewModel(ref, null)..notifyInit();
    }
);