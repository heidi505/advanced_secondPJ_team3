import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
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
    Logger().d(paramStore.notifyText);
    //Logger().d("+++++++${paramStore.chatroomDTO?.chatDocId}");
    await ChatRepository().addNotify(textController, session.user!.id!,  paramStore.chatRoomDocId!);
  }
  //state = NotifyChatWriteModel(notifyItem: NotifyItem());

}

final chatNotifyWriteProvider = StateNotifierProvider.autoDispose<
    NotifyChatWriteViewModel, NotifyChatWriteModel?>((ref) {
  return new NotifyChatWriteViewModel(ref, null)..notifyInit();
});
