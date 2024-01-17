import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_detail_response_dto/profile_detail_response_dto.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import '../../ui/pages/profile/widgets/profile_detail_model.dart';
import '../dto/response_dto.dart';
import '../model/profile_detail_model.dart';
import '../repository/user_repository.dart';


// 모델
class ProfileDetailModel {
  ProfileDetailResponseDTO profileDetailResponseDTO;
  ProfileDetailModel(this.profileDetailResponseDTO);
}

// 뷰모델
class ProfileDetailViewModel extends StateNotifier<ProfileDetailModel?>{
  // Provider에 접근
  Ref ref;
  // 생성자
  ProfileDetailViewModel(super._state, this.ref);
  // 화면이 그려지기 전에 값을 가져오거나 초기화하는 역할
  Future<void> notifyInit() async {
    int id = ref.read(sessionProvider).user?.id ?? 1;
    // 통신을 통해 가져온 값 담기
    ResponseDTO responseDTO = await UserRepository().fetchProfileDetail(id);
    state = ProfileDetailModel(responseDTO.data);
  }
}

// 프로바이더
final profileDetailProvider =
  StateNotifierProvider.autoDispose<ProfileDetailViewModel, ProfileDetailModel?>((ref){
  return ProfileDetailViewModel(null, ref)..notifyInit();
});