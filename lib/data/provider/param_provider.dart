import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/main.dart';

import '../dto/chat_dto/chatting_list_page_dto.dart';

class RequestParam {
  String? chatRoomDocId;

  RequestParam({this.chatRoomDocId});
}

class ParamStore extends RequestParam{
  final mContext = navigatorKey.currentContext;

  void addChatRoomDocId(String chatRoomDocId){
    this.chatRoomDocId = chatRoomDocId;
  }


}

final paramProvider = Provider<ParamStore>((ref){
  return new ParamStore();
});