
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_update_request_dto/profile_update_request_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';

// 모델 (상태)
class ProfileUpdateModel{
  ProfileUpdateRequestDTO profileUpdateRequestDTO;
  ProfileUpdateModel(this.profileUpdateRequestDTO);
}

// 뷰모델
class ProfileUpdateViewModel extends StateNotifier<ProfileUpdateModel?> {
  // Provider에 접근
  Ref ref;
  // 생성자
  ProfileUpdateViewModel(super._state, this.ref);

  // 화면이 그려지기 전에 값을 가져오거나 초기화하는 역할
  Future<void> notifyInit(ProfileUpdateRequestDTO profileUpdateRequestDTO) async {
  ResponseDTO responseDTO = await UserRepository().fetchProfileUpdate(profileUpdateRequestDTO);
  state = ProfileUpdateModel(profileUpdateRequestDTO);
  }
}

// 프로바이더
final profileUpdateProvider =
  StateNotifierProvider<ProfileUpdateViewModel, ProfileUpdateModel?>((ref){
    ProfileUpdateRequestDTO profileUpdateRequestDTO = new ProfileUpdateRequestDTO();

  return ProfileUpdateViewModel(null, ref)..notifyInit(profileUpdateRequestDTO);
});


