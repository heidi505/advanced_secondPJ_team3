import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/friend_dto/friend_search_response_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_detail_response_dto/profile_detail_response_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/friend_repository.dart';
import 'package:team3_kakao/main.dart';

class FriendAddModel {
  ProfileDetailResponseDTO? profileDetailResponseDTO;
  List<FriendsDTO>? friendsList;

  FriendAddModel({this.profileDetailResponseDTO, this.friendsList});
}

class FriendAddViewModel extends StateNotifier<FriendAddModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;
  FriendAddViewModel(this.ref, super._state);

  Future<void> fetchSearchingFriend() async {
    ParamStore paramStore = ref.read(paramProvider);
    SessionUser user = ref.read(sessionProvider);

    ResponseDTO responseDTO = await FriendRepository()
        .fetchSearchingFriend(paramStore.phoneNumForSearch!, user.user!.jwt!);

    ProfileDetailResponseDTO dto = responseDTO.data;

    state = FriendAddModel(profileDetailResponseDTO: dto);
  }
}

final friendAddProvier =
    StateNotifierProvider.autoDispose<FriendAddViewModel, FriendAddModel?>(
        (ref) {
  return FriendAddViewModel(ref, null);
});
