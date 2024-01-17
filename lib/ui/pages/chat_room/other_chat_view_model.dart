import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/chat_repository.dart';
import 'package:team3_kakao/main.dart';
import 'package:team3_kakao/ui/pages/chatting/chatting_list_page_view_model.dart';

import '../../../data/dto/chat_dto/chatting_list_page_dto.dart';
import '../../../data/dto/friend_dto/chat_users_dto.dart';

class OtherChatModel{
  List<MessageDTO> messages;


  OtherChatModel({required this.messages});
}

class OtherChatViewModel extends StateNotifier<OtherChatModel?>{
  Ref ref;
  final mContext = navigatorKey.currentContext;

  OtherChatViewModel(this.ref, super._state);

  Future<void> notifyInit() async{
    ParamStore paramStore = ref.read(paramProvider);
    SessionUser session = ref.read(sessionProvider);

    ChatRepository().fetchMessages(paramStore.chatRoomDocId!, session.user!.id!).listen((event) async {

      List<int?> userIdList = event.map((e) => e.userId).toSet().toList();

      ResponseDTO responseDTO= await ChatRepository().getChatUsers(userIdList, session.user!.jwt!);
      List<ChatUsersDTO> dtoList = responseDTO.data;
      print('dtoList : ${dtoList.toString()}' );

      for(MessageDTO message in event){
        for(ChatUsersDTO dto in dtoList){
          Logger().d("로그1");
          if(message.userId == dto.userId){
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


  Future<void> addMessage(String text) async{
    SessionUser session = ref.read(sessionProvider);
    ParamStore paramStore = ref.read(paramProvider);
    await ChatRepository().addMessage(text, session.user!.id!, paramStore.chatRoomDocId!);
  }

  Future<void> insertOneToOneChat() async{
    SessionUser session = ref.read(sessionProvider);
    ParamStore paramStore = ref.read(paramProvider);

    final newChatDoc = await ChatRepository().insertOneToOneChat(session.user!, paramStore.friendDTO!);

    paramStore.addChatRoomDocId(newChatDoc.id);

  }

  // List<MessageDTO> newMessageList = [];
  // state = OtherChatModel(messages: newMessageList);
  // ChatRepository().fetchMessages().listen((event) {
  // state = OtherChatModel(messages: newMessageList);
  // });
}

final otherChatProvider = StateNotifierProvider.autoDispose<OtherChatViewModel, OtherChatModel?>((ref){
  return new OtherChatViewModel(ref, null)..notifyInit();
});