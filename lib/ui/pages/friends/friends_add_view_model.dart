import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_detail_response_dto/profile_detail_response_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/friend_repository.dart';
import 'package:team3_kakao/main.dart';

class FriendAddModel{
  ProfileDetailResponseDTO? profileDetailResponseDTO;

  FriendAddModel({this.profileDetailResponseDTO});
}

class FriendAddViewModel extends StateNotifier<FriendAddModel?>{
  Ref ref;
  final mContext = navigatorKey.currentContext;
  FriendAddViewModel(this.ref, super._state);

  Future<void> fetchSearchingFriend() async{
    ParamStore paramStore = ref.read(paramProvider);
    SessionUser user = ref.read(sessionProvider);

    ResponseDTO responseDTO = await FriendRepository().fetchSearchingFriend(paramStore.phoneNumForSearch!, user.user!.jwt!);

    state = FriendAddModel(profileDetailResponseDTO: responseDTO.data);
  }
}

final friendAddProvier = StateNotifierProvider<FriendAddViewModel, FriendAddModel?>((ref) {
  return FriendAddViewModel(ref, null);
});