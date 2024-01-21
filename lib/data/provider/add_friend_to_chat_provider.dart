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
  Ref ref;
  final mContext = navigatorKey.currentContext;

  AddFriendToChatViewModel(this.ref, super._state);

  Future<void> friendsToAdd(FriendsDTO friend) async {
    List<FriendsDTO> oldList = state!.friendsToAdd!;
    oldList.add(friend);

    state = AddFriendToChatModel(friendsToAdd: oldList);
  }
}

final addFriendToChatProvider = StateNotifierProvider.autoDispose<
    AddFriendToChatViewModel, AddFriendToChatModel?>((ref) {
  List<FriendsDTO> init = [];
  return AddFriendToChatViewModel(
      ref, AddFriendToChatModel(friendsToAdd: init));
});
