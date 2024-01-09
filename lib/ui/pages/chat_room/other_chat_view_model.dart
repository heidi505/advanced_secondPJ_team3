import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/repository/chat_repository.dart';
import 'package:team3_kakao/main.dart';
import 'package:team3_kakao/ui/pages/chatting/chatting_list_page_view_model.dart';

import '../../../data/dto/chat_dto/chatting_list_page_dto.dart';

class OtherChatModel{
  List<MessageDTO> messages;

  OtherChatModel({required this.messages});
}

class OtherChatViewModel extends StateNotifier<OtherChatModel?>{
  Ref ref;
  final mContext = navigatorKey.currentContext;

  OtherChatViewModel(this.ref, super._state);

  Future<void> notifyInit() async{
    List<MessageDTO> newMessageList = [];
    state = OtherChatModel(messages: newMessageList);
    ChatRepository().fetchMessages().listen((event) {
      state = OtherChatModel(messages: newMessageList);
    });
    

  }

  Future<void> addMessage(String text) async{
    await ChatRepository().addMessage(text);
  }


}

final otherChatProvider = StateNotifierProvider.autoDispose<OtherChatViewModel, OtherChatModel?>((ref){
  return new OtherChatViewModel(ref, null)..notifyInit();
});