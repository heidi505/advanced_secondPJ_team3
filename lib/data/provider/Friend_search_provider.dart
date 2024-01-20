import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/friend_dto/friend_search_response_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';
import 'package:team3_kakao/main.dart';

class FriendSearchModel {
  String? keyword;
  List<FriendSearchResponseDTO>? friendSerchResponseDTO;
  FriendSearchModel({this.keyword, this.friendSerchResponseDTO});
}

// 2. 창고
class FriendSearchViewModel extends StateNotifier<FriendSearchModel?> {
  FriendSearchViewModel(super._state, this.ref);
  final mContext = navigatorKey.currentContext;
  Ref ref;

  void updateSearchKeyword(String newKeyword) {
    Logger().d("키워드 메서드 동작 $newKeyword");
    state = FriendSearchModel(
        keyword: newKeyword ?? "",
        friendSerchResponseDTO: state?.friendSerchResponseDTO ?? []);
  }

  Future<void> notifyInit() async {
    SessionUser? sessionUser = ref.read(sessionProvider);

    Logger().d("노티파이 진입");
    ResponseDTO responseDTO = await UserRepository()
        .fetchFriendSearch(state!.keyword!, sessionUser!.user!.jwt!);
    Logger().d(responseDTO.data);
    state = FriendSearchModel(friendSerchResponseDTO: responseDTO.data);
  }
}

// 3. 창고 관리자
final searchProvider = StateNotifierProvider.autoDispose<FriendSearchViewModel,
    FriendSearchModel?>((ref) {
  return FriendSearchViewModel(
      FriendSearchModel(friendSerchResponseDTO: []), ref);
});
