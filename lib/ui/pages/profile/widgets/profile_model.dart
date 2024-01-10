
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/my_profile_detail_response_dto/my_profile_detail_response_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';

// 모델
class ProfileModel {
  final int id;
  final String nickname;
  final String profileImage;
  final String backImage;
  final String statusMessage;


  ProfileModel({
    required this.id,
    required this.nickname,
    required this.profileImage,
    required this.backImage,
    required this.statusMessage,
  });

  ProfileModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        nickname = json["nickname"],
        profileImage = json["profileImage"],
        backImage = json["backImage"],
        statusMessage = json["statusMessage"];
}

// 뷰모델
class ProfileViewModel extends StateNotifier<ProfileModel?> {

  Ref ref;
  ProfileViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    Logger().d("화면 그리기 전 완료");

    //  SessionUser sessionUser = ref.read(sessionStore);
    ResponseDTO responseDTO = await UserRepository().fetchUserInfo();
    Logger().d("통신 하고 데이터 받아옴 : ${responseDTO.data}" );
    ProfileModel model = responseDTO.data;
    state = ProfileModel(
        id: model.id,
        nickname: model.nickname,
        profileImage: model.profileImage,
        backImage: model.backImage,
        statusMessage: model.statusMessage);
    Logger().d("상태 : ${state?.nickname}");
  }
}

// 프로바이더
final profileProvider = StateNotifierProvider.autoDispose<
    ProfileViewModel, ProfileModel?>((ref) {
  Logger().d("프로바이드 접근 완료");
  return ProfileViewModel(null, ref)..notifyInit();
});
