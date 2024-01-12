import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/friend_add_dto/phoneNum_friend_add_request_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';

// 모델 (상태)
class PhoneNumFriendAddModel {
  PhoneNumFriendAddRequestDTO phoneNumFriendAddRequestDTO;
  PhoneNumFriendAddModel(this.phoneNumFriendAddRequestDTO);
}

// 뷰모델
class PhoneNumFriendAddViewModel extends StateNotifier<PhoneNumFriendAddModel?> {
  Ref ref;
  PhoneNumFriendAddViewModel(super._state, this.ref);
  Future<void> notifyInit(PhoneNumFriendAddRequestDTO phoneNumFriendAddRequestDTO) async {
    ResponseDTO responseDTO = await UserRepository().fetchPhoneNumFriendAdd(phoneNumFriendAddRequestDTO);
    state = PhoneNumFriendAddModel(phoneNumFriendAddRequestDTO);
  }
}

// 프로바이더
final PhoneNumFriendAddProvider =
    StateNotifierProvider<PhoneNumFriendAddViewModel, PhoneNumFriendAddModel?>((ref) {
    PhoneNumFriendAddRequestDTO phoneNumFriendAddRequestDTO = new PhoneNumFriendAddRequestDTO();
    return PhoneNumFriendAddViewModel(null, ref)..notifyInit(phoneNumFriendAddRequestDTO);
});