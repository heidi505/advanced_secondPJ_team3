import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_update_request_dto/profile_update_request_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';

import '../dto/profile_dto/profile_update_response_dto/profile_update_response_dto.dart';

// 모델 (상태)
class ProfileUpdateModel {
  ProfileUpdateResponseDTO profileUpdateResponseDTO;
  ProfileUpdateModel(this.profileUpdateResponseDTO);
}

// 뷰모델
class ProfileUpdateViewModel extends StateNotifier<ProfileUpdateModel?> {
  // Provider에 접근
  Ref ref;
  // 생성자
  ProfileUpdateViewModel(super._state, this.ref);

  // 화면이 그려지기 전에 값을 가져오거나 초기화하는 역할
  Future<void> notifyInit() async {
    int? sessionId = ref.read(sessionProvider).user?.id;
    String sessionJwt = ref.read(sessionProvider).user!.jwt!;
    ResponseDTO responseDTO =
        await UserRepository().fetchProfileDetail(sessionId, sessionJwt);
    state = ProfileUpdateModel(responseDTO.data);
  }

  Future<void> updateProfile(
      ProfileUpdateRequestDTO profileUpdateRequestDto) async {
    Logger().d("업데이트 레파지토리 진입 전(닉네임) : ${profileUpdateRequestDto.nickname}");
    Logger()
        .d("업데이트 레파지토리 진입 전(상태메세지) : ${profileUpdateRequestDto.statusMessage}");
    ResponseDTO responseDTO = await UserRepository().fetchProfileUpdate(
        profileUpdateRequestDto, ref.read(sessionProvider).user!.jwt!);
    Logger().d("업데이트 실패해서 나옴? ${responseDTO.errorType?.message}");
    state = ProfileUpdateModel(responseDTO.data);
  }
}

// 프로바이더
final profileUpdateProvider =
    StateNotifierProvider<ProfileUpdateViewModel, ProfileUpdateModel?>((ref) {
  return ProfileUpdateViewModel(null, ref)..notifyInit();
});
