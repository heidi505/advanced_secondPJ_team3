import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_backImage_delete_response_dto/profile_backimage_delete_response_dto.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';

import '../dto/profile_dto/profile_image_delete_response_dto/profile_image_delete_response_dto.dart';
import '../dto/response_dto.dart';

// 모델
class ProfileImageDeleteModel {
  ProfileImageDeleteResponseDTO profileImageDeleteResponseDTO;
  ProfileImageDeleteModel(this.profileImageDeleteResponseDTO);
}

// 뷰모델
class ProfileImageDeleteViewModel extends StateNotifier<ProfileImageDeleteModel?> {
  Ref ref;
  ProfileImageDeleteViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await UserRepository().fetchProfileImageDelete();
    state = ProfileImageDeleteModel(responseDTO.data);
  }
}

// 프로바이더
final profileImageDeleteProvider =
    StateNotifierProvider.autoDispose<ProfileImageDeleteViewModel, ProfileImageDeleteModel>((ref){
    return ProfileImageDeleteViewModel(null, ref)..notifyInit();
});