import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/main.dart';

import '../dto/chat_dto/chatting_list_page_dto.dart';
import '../dto/profile_dto/profile_update_response_dto/profile_update_response_dto.dart';

class RequestParam {
  String? chatRoomDocId;
  ChatroomDTO? chatroomDTO;
  FriendsDTO? friendDTO;
  ProfileUpdateResponseDTO? profileUpdateResponseDto;

  RequestParam({this.chatRoomDocId, this.chatroomDTO, this.friendDTO, this.profileUpdateResponseDto});
}

class ParamStore extends RequestParam{
  final mContext = navigatorKey.currentContext;

  void addChatRoomDocId(String chatRoomDocId){
    this.chatRoomDocId = chatRoomDocId;
  }

  void addChatRoomDTO(ChatroomDTO chatroomDTO){
    this.chatroomDTO = chatroomDTO;
  }

  void addProfileDetail(FriendsDTO friendDTO){
    this.friendDTO = friendDTO;
  }

  void addProfileUpdate(ProfileUpdateResponseDTO profileUpdateResponseDto){
    this.profileUpdateResponseDto = profileUpdateResponseDto;
  }

}

final paramProvider = Provider<ParamStore>((ref){
  return new ParamStore();
});