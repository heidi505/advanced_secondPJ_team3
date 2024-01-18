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
  List<ChatNotifyDTO>? chatNotifyDTOList;

  ChatNotifyModel({this.chatNotifyDTOList});
}

class ChatNotifyViewModel extends StateNotifier<ChatNotifyModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  ChatNotifyViewModel(this.ref, super._state);

  Future<void> notifyInit() async {
    ParamStore paramStore = ref.read(paramProvider);
    //Logger().d("+++++++${paramStore.chatroomDTO?.chatDocId}"); //ok
    SessionUser session = ref.read(sessionProvider);
    //Logger().d(session.user?.id); //ok

    //1. chatRoom1 컬렉션의 , users 일치하는 문서 찾기
    //2. 문서의, chatNotify 일치하는 컬렉션 찾기
    final FirebaseFirestore db = FirebaseFirestore.instance;
    //채팅방 목록 조회
    QuerySnapshot<Map<String, dynamic>> chatRoomCollection = await db
        .collection("ChatRoom1")
        .where("users", arrayContains: session.user!.id) //userId 포함된 users 조회
        .get();
    Logger().d("여기를가긴가나");
    Logger().d("쿼리 결과 길이: ${chatRoomCollection.docs.length}");

    List<ChatNotifyDTO> dtoList = [];

    //for문 돌면서 순회
    for (QueryDocumentSnapshot<
        Map<String, dynamic>> chatDoc in chatRoomCollection.docs) {
      Map<String, dynamic>? data = chatDoc.data();

      Logger().d("+++${data["chatName"]}");
      // 문서의 데이터 가져오기
      Logger().d(
          "+++채팅방 조회함돠+++ : ${chatRoomCollection.docs.map((e) => e.data())}");
      Logger().d("++유저아이디!!!!!+++ : ${session.user!.id}");

      //채팅방 목록 돌아보면서 필터링

      for (var chatDoc in chatRoomCollection.docs) {
        //chatRoom 문서
        dynamic data = chatDoc.data();
        Logger().d("+++채팅방 필터링 중+++ : ${data}");

        // 채팅방 정보 추출
        String chatName = data["chatName"];
        List<dynamic> users = data["users"];
        Logger().d("+++정보 추출 중+++");

        //ChatRoom1 안에 chatNotify 컬렉션 접근
        CollectionReference<Map<String, dynamic>> chatNotifyCollection =
        await db.collection("ChatRoom1").doc(chatDoc.id).collection(
            "chatNotify");
        Logger().d("+++서브 컬렉션 접근+++ ${chatNotifyCollection.toString()}");

        //chatNotify 문서 들고 오기
        QuerySnapshot<Map<String, dynamic>> chatNotifyDocs =
        await chatNotifyCollection.get();
        Logger().d(
            "+++컬렉션 문서 들고오는 중++++${chatNotifyDocs.docs.length}"); //ok --1

        //문서 필드 확인
        for (QueryDocumentSnapshot<Map<String, dynamic>> chatNotifyDoc in chatNotifyDocs.docs) {
          Map<String, dynamic>? data = chatNotifyDoc.data();

          Logger().d("+++data+++ $data"); //ok

          // 가져온 문서들을 DTO로 변환하고 리스트에 추가
          // List<ChatNotifyDTO> chatNotifyDTOList = chatNotifyDocs.docs
          //     .map((chatNotifyDoc) =>
          //     ChatNotifyDTO.fromJson(chatNotifyDoc.data(), chatNotifyDoc.id))
          //     .toList();
          // Logger().d("+++리스트에 추가 +++ ${chatNotifyDTOList.toString()}");
          // dtoList.addAll(chatNotifyDTOList);
          ChatNotifyDTO chatNotifyDTOList = ChatNotifyDTO.fromJson(data, chatNotifyDoc.id);
          Logger().d("+++리스트에 추가 +++ ${chatNotifyDTOList.content}");
          dtoList.add(chatNotifyDTOList);
        }
        state = ChatNotifyModel(chatNotifyDTOList: dtoList);
        //기존의 chatNotifyDTOList dtoList 다시 갱신해줘야함 !!
      }
//
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
  }

}

  final chatNotifyProvider =
  StateNotifierProvider.autoDispose<ChatNotifyViewModel, ChatNotifyModel?>(
          (ref) {
        return ChatNotifyViewModel(ref, null)
          ..notifyInit();
      });
