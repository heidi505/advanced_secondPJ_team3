import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/main.dart';

import '../dto/chat_dto/chatting_list_page_dto.dart';

class RequestParam {
  List<ChatroomDTO>? chatRoomDTOList;

  RequestParam({this.chatRoomDTOList});
}

class ParamStore extends RequestParam{
  final mContext = navigatorKey.currentContext;

  void addChatRoomList(List<ChatroomDTO> chatRoomDTOList){
    this.chatRoomDTOList = chatRoomDTOList;
  }

}

final paramProvider = Provider<ParamStore>((ref){
  return new ParamStore();
});