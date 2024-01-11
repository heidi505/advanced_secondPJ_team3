import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import '../../ui/pages/profile/widgets/profile_detail_model.dart';
import '../dto/response_dto.dart';
import '../model/profile_detail_model.dart';
import '../repository/user_repository.dart';

// 뷰모델
class ProfileDetailViewModel extends StateNotifier<ProfileDetailModel?> {
  Ref ref;
  ProfileDetailViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    Logger().d("화면 그리기 전 완료");

    //  SessionUser sessionUser = ref.read(sessionStore);
    ResponseDTO responseDTO = await UserRepository().fetchProfileDetail();
    Logger().d("통신 하고 데이터 받아옴 : ${responseDTO.data}" );
    ProfileDetailModel model = responseDTO.data;
    state = ProfileDetailModel(
        id: model.id,
        nickname: model.nickname,
        profileImage: model.profileImage,
        backImage: model.backImage,
        statusMessage: model.statusMessage);
    Logger().d("상태 : ${state?.nickname}");
  }
}

// 프로바이더
final profileDetailProvider =
  StateNotifierProvider.autoDispose<ProfileDetailViewModel, ProfileDetailModel?>((ref){
  Logger().d("프로바이드 접근 완료");
  return ProfileDetailViewModel(null, ref)..notifyInit();
});