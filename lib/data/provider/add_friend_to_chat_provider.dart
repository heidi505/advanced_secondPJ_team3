import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/friend_dto/friend_search_response_dto.dart';

import '../../main.dart';
import '../dto/friend_dto/main_dto.dart';

class AddFriendToChatModel {
  List<FriendsDTO>? friendsToAdd;

  AddFriendToChatModel({this.friendsToAdd});
}

class AddFriendToChatViewModel extends StateNotifier<AddFriendToChatModel?> {
  AddFriendToChatViewModel(this.ref, super._state);

  Ref ref;
  final mContext = navigatorKey.currentContext;

  void friendsToAdd(FriendsDTO friend) {
    List<FriendsDTO> oldList = state!.friendsToAdd!;

    List<FriendsDTO> newList = [...oldList];
    newList.add(friend);
    state = AddFriendToChatModel(friendsToAdd: newList);
  }
}

final addFriendToChatProvider = StateNotifierProvider.autoDispose<
    AddFriendToChatViewModel, AddFriendToChatModel?>((ref) {
  List<FriendsDTO> init = [];
  return AddFriendToChatViewModel(
      ref, AddFriendToChatModel(friendsToAdd: init));
});
