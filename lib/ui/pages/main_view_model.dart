import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/chat_dto/chatting_list_page_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/friend_repository.dart';
import 'package:team3_kakao/main.dart';

import '../../_core/constants/move.dart';
import '../../data/provider/param_provider.dart';

class MainPageModel {
  MainDTO? mainDTO;

  MainPageModel({this.mainDTO});
}

class MainPageViewModel extends StateNotifier<MainPageModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext!;

  MainPageViewModel(this.ref, super._state);

  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    Logger().d(sessionUser.user!.id);
    ResponseDTO responseDTO = await FriendRepository()
        .notifyMain(sessionUser.user!.id!, sessionUser.user!.jwt!);

    MainDTO mainDTO = responseDTO.data;

    state = MainPageModel(mainDTO: responseDTO.data);
  }

  Future<void> addFriend() async {
    ParamStore paramStore = ref.read(paramProvider);
    SessionUser user = ref.read(sessionProvider);

    ResponseDTO responseDTO = await FriendRepository().addFriend(
        paramStore.phoneNumForSearch!, user.user!.jwt!, user.user!.id!);

    state = MainPageModel(mainDTO: responseDTO.data);

    Navigator.pushNamed(mContext!, Move.mainPage);
  }

  void addFavorites(String chatDocId) {
    MainDTO oldMain = state!.mainDTO!;
    ChatroomDTO favChatRoom =
    oldMain.favorites =
    List<ChatroomDTO> newFav =
  }
}

final mainProvider =
    StateNotifierProvider<MainPageViewModel, MainPageModel?>((ref) {
  return MainPageViewModel(ref, null)..notifyInit();
});
