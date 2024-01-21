import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/chat_dto/chat_notify_list_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/chat_users_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/favorite_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/model/chat_notify_item.dart';
import 'package:team3_kakao/main.dart';
import '../dto/chat_dto/chatting_list_page_dto.dart';
import '../dto/profile_dto/profile_update_response_dto/profile_update_response_dto.dart';

class RequestParam {
  String? chatRoomDocId;
  ChatroomDTO? chatroomDTO;
  ChatNotifyDTO? chatNotifyDTO;
  FriendsDTO? friendDTO;
  String? notifyText;
  NotifyItem? notifyItem;
  int? chatId;
  bool? isChattingLisPage = false;
  bool? isVisible = false;
  ProfileUpdateResponseDTO? profileUpdateResponseDTO;
  List<ChatUsersDTO>? chatUsers;
  FavoriteFriendDTO? favoriteFriendDTO;
  String? phoneNumForSearch;
  String? searchKeyword;

  RequestParam({
    this.chatRoomDocId,
    this.chatroomDTO,
    this.chatNotifyDTO,
    this.friendDTO,
    this.notifyText,
    this.notifyItem,
    this.chatId,
    this.isVisible,
  });
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

  void addNotifyChatId(int chatId) {
    this.chatId = chatId;
  }

  void addNotifyItem(NotifyItem notifyItem) {
    this.notifyItem = notifyItem;
  }

  void addChatUsersList(List<ChatUsersDTO> dtoList) {
    this.chatUsers = dtoList;
  }

  void addFavoriteStatus(FriendsDTO friendDTO) {
    this.friendDTO = friendDTO;
  }

  void addPhoneNumForSearch(String value) {
    this.phoneNumForSearch = value;
  }

  void addSearchKeyword(String value) {
    this.searchKeyword = value;
  }
}

final paramProvider = Provider<ParamStore>((ref) {
  print('파람 프로바이더 진입함?');
  return new ParamStore();
});
