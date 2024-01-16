import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/main.dart';

import '../dto/chat_dto/chatting_list_page_dto.dart';

class RequestParam {
  String? chatRoomDocId;
  ChatroomDTO? chatroomDTO;

  RequestParam({this.chatRoomDocId, this.chatroomDTO});
}

class ParamStore extends RequestParam{
  final mContext = navigatorKey.currentContext;

  void addChatRoomDocId(String chatRoomDocId){
    this.chatRoomDocId = chatRoomDocId;
  }

  void addChatRoomDTO(ChatroomDTO chatroomDTO){
    this.chatroomDTO = chatroomDTO;
  }

}

final paramProvider = Provider<ParamStore>((ref){
  return new ParamStore();
});