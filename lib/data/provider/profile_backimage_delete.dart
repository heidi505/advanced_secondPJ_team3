
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';

import '../dto/profile_dto/profile_backImage_delete_response_dto/profile_backimage_delete_response_dto.dart';
import '../dto/response_dto.dart';

// 모델
class ProfileBackImageDeleteModel {
  ProfileBackImageDeleteResponseDTO profileBackImageDeleteResponseDTO;
  ProfileBackImageDeleteModel(this.profileBackImageDeleteResponseDTO);
}

// 뷰모델
class ProfileBackImageDeleteViewModel extends StateNotifier<ProfileBackImageDeleteModel?> {
  Ref ref;
  ProfileBackImageDeleteViewModel(super._state, this.ref);
  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await UserRepository().fetchProfileBackImageDelete();
    state = ProfileBackImageDeleteModel(responseDTO.data);
  }
}

// 프로바이더
final profileBackImageDeleteProvider =
    StateNotifierProvider.autoDispose<ProfileBackImageDeleteViewModel, ProfileBackImageDeleteModel>((ref) {
    return ProfileBackImageDeleteViewModel(null, ref)..notifyInit();
});
