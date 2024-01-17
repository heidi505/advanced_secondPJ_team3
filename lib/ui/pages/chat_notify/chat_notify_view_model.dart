import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/chat_dto/chatting_list_page_dto.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/chat_repository.dart';

import '../../../main.dart';

class ChatNotifyModel{
  List<ChatNotifyDTO> notifyList;

  ChatNotifyModel({required this.notifyList});
}

class ChatNotifyViewModel extends StateNotifier<ChatNotifyViewModel?>{
  Ref ref;
  final mContext = navigatorKey.currentContext;

  ChatNotifyViewModel(this.ref, super._state);

  Future<void> notifyInit() async{
    ParamStore paramStore = ref.read(paramProvider);
    SessionUser session = ref.read(sessionProvider);

    Stream<List<ChatNotifyDTO>> notifyList = await ChatRepository().fetchChatNotify(paramStore.chatRoomDocId!, session.user!.id!);
    state = ChatNotifyModel(notifyList: []) as ChatNotifyViewModel?;

    // ChatRepository().fetchChatNotify(paramStore.chatRoomDocId!, session.user!.id!).listen((event) {
    //   state = ChatNotifyModel(messages: event);
    // }); //공지 등록한거 불러오기
  }

  //
  // Future<void> addMessage(String text) async{
  //   SessionUser session = ref.read(sessionProvider);
  //   ParamStore paramStore = ref.read(paramProvider);
  //   await ChatRepository().addMessage(text, session.user!.id!, paramStore.chatRoomDocId!);
  // }

// List<MessageDTO> newMessageList = [];
// state = OtherChatModel(messages: newMessageList);
// ChatRepository().fetchMessages().listen((event) {
// state = OtherChatModel(messages: newMessageList);
// });
}

final otherChatProvider = StateNotifierProvider.autoDispose<ChatNotifyViewModel, ChatNotifyModel?>((ref){
  return new ChatNotifyViewModel(ref, null)..notifyInit();
});