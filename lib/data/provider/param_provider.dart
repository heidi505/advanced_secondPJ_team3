import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/chat_dto/chat_notify_list_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/favorite_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/main.dart';

import '../dto/chat_dto/chatting_list_page_dto.dart';
import '../dto/profile_dto/profile_update_response_dto/profile_update_response_dto.dart';

class RequestParam {
  String? chatRoomDocId;
  ChatroomDTO? chatroomDTO;
  ChatNotifyDTO? chatNotifyDTO;
  FriendsDTO? friendDTO;
  String? notifyText;
  bool? isChattingLisPage = false;
  ProfileUpdateResponseDTO? profileUpdateResponseDTO;
  FavoriteFriendDTO? favoriteFriendDTO;

  RequestParam({this.chatRoomDocId,
    this.chatroomDTO,
    this.chatNotifyDTO,
    this.friendDTO,
    this.notifyText,
    this.favoriteFriendDTO,});
}

class ParamStore extends RequestParam {
  final mContext = navigatorKey.currentContext;

  void addChatRoomDocId(String chatRoomDocId) {
    this.chatRoomDocId = chatRoomDocId;
  }

  void addChatRoomDTO(ChatroomDTO chatroomDTO) {
    this.chatroomDTO = chatroomDTO;
  }

  void addProfileDetail(FriendsDTO friendDTO) {
    this.friendDTO = friendDTO;
  }

  void addNotifyText(String submitText) {
    this.notifyText = submitText;
  }

  void addProfileUpdate(ProfileUpdateResponseDTO profileUpdateResponseDto) {
    this.profileUpdateResponseDTO = profileUpdateResponseDto;
  }

  void addFavoriteStatus(FriendsDTO friendDTO) {
    this.friendDTO = friendDTO;
  }

}

final paramProvider = Provider<ParamStore>((ref) {
  return new ParamStore();
});
