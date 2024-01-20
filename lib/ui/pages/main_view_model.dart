import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/friend_repository.dart';
import 'package:team3_kakao/main.dart';

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
}

final mainProvider =
    StateNotifierProvider<MainPageViewModel, MainPageModel?>((ref) {
  return MainPageViewModel(ref, MainPageModel(mainDTO: null))..notifyInit();
});
