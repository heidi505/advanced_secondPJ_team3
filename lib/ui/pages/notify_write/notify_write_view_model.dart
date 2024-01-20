import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/data/dto/chat_dto/chat_notify_list_dto.dart';
import 'package:team3_kakao/data/model/chat_notify_item.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/chat_repository.dart';
import 'package:team3_kakao/main.dart';

class NotifyChatWriteModel {
  NotifyItem? notifyItem;
  NotifyChatWriteModel({this.notifyItem});
}

class NotifyChatWriteViewModel extends StateNotifier<NotifyChatWriteModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  NotifyChatWriteViewModel(this.ref, super.state);

  Future<void> notifyInit() async {
    SessionUser session = ref.read(sessionProvider);
    Logger().d(session.user?.id);
    ParamStore paramStore = ref.read(paramProvider);
    Logger().d("+++++++${paramStore.chatroomDTO?.chatDocId}");
  }

  Future<void> addChatNotify(String textController) async {
    SessionUser session = ref.read(sessionProvider);
    //Logger().d(session.user?.id);
    ParamStore paramStore = ref.read(paramProvider);
    Logger().d("!!!!!!!!!!!!! ${paramStore.notifyText}");

    await ChatRepository().addNotify(textController, session.user!.id!,paramStore.chatRoomDocId!, mContext!);
    Logger().d("+++++++${paramStore.chatRoomDocId}");
    Logger().d("+++++++${paramStore.chatroomDTO?.chatId}");

  }
  //state = NotifyChatWriteModel(notifyItem: NotifyItem());

}

final chatNotifyWriteProvider = StateNotifierProvider.autoDispose<
    NotifyChatWriteViewModel, NotifyChatWriteModel?>((ref) {
  return new NotifyChatWriteViewModel(ref, null)..notifyInit();
});
