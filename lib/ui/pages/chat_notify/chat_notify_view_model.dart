import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/chat_dto/chat_notify_list_dto.dart';
import 'package:team3_kakao/data/dto/chat_dto/chatting_list_page_dto.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/chat_repository.dart';

import '../../../main.dart';

class ChatNotifyModel {
  List<ChatNotifyDTO>? notifyList;

  ChatNotifyModel({this.notifyList});
}

class ChatNotifyViewModel extends StateNotifier<ChatNotifyModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  ChatNotifyViewModel(this.ref, super._state);

  Future<void> notifyInit() async {
    ParamStore paramStore = ref.read(paramProvider);
    Logger().d("+++++++${paramStore.chatroomDTO?.chatDocId}"); //ok
    SessionUser session = ref.read(sessionProvider);
    Logger().d(session.user?.id); //ok

    final FirebaseFirestore db = FirebaseFirestore.instance;
    //채팅방 목록 조회
    QuerySnapshot<Map<String, dynamic>> chatRoomCollection = await db
        .collection("chatNotify")
        .where("userId", arrayContains: session.user!.id)
        .get();
    Logger().d("+++채팅방 조회함돠+++ : ${chatRoomCollection}");

    //채팅방 목록 돌아보면서 필터링
    List<dynamic> dtoList = [];
    for (var chatDoc in chatRoomCollection.docs) {
      dynamic data = chatDoc.data();
      Logger().d("+++채팅방 필터링 중+++ : ${chatRoomCollection.docs}");

      // 채팅방 정보 추출
      String chatName = data["chatName"];
      List<dynamic> users = data["users"];

      Logger().d("+++정보 추출 중+++");

      //ChatRoom1 안에 chatNotify 컬렉션 접근
      CollectionReference<Map<String, dynamic>> chatNotifyCollection =
          db.collection("ChatRoom1").doc(chatDoc.id).collection("chatNotify");
      Logger().d("+++서브 컬렉션 접근+++");
      //chatNotify 문서 들고 오기
      QuerySnapshot<Map<String, dynamic>> chatNotifyDocs =
          await chatNotifyCollection.get();
      Logger().d("+++컬렉션 문서 들고오는 중+++");

      // 가져온 문서들을 DTO로 변환하고 리스트에 추가
      List<ChatNotifyDTO> chatNotifyDTOList = chatNotifyDocs.docs
          .map((chatNotifyDoc) =>
              ChatNotifyDTO.fromJson(chatNotifyDoc.data(), chatNotifyDoc.id))
          .toList();
      Logger().d("+++리스트에 추가 +++");
      dtoList.addAll(chatNotifyDTOList);
    }
  }

// Future<void> addMessage(String text) async{
//   SessionUser session = ref.read(sessionProvider);
//   ParamStore paramStore = ref.read(paramProvider);
//   await ChatRepository().addMessage(text, session.user!.id!, paramStore.chatRoomDocId!);
// }

// List<MessageDTO> newMessageList = [];
// state = OtherChatModel(messages: newMessageList);
// ChatRepository().fetchMessages().listen((event) {
// state = OtherChatModel(messages: newMessageList);
// });
// }
}

final chatNotifyProvider = StateNotifierProvider.autoDispose<ChatNotifyViewModel, ChatNotifyModel?>(
        (ref) {
  return ChatNotifyViewModel(ref, null)..notifyInit();
});
