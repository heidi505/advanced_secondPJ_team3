import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/friend_add_dto/email_friend_add_request_dto.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';

import '../dto/response_dto.dart';

// 모델 (상태)
class EmailFriendAddModel {
  EmailFrinedAddRequestDTO emailFrinedAddRequestDTO;
  EmailFriendAddModel(this.emailFrinedAddRequestDTO);
}

// 뷰모델
class EmailFriendAddViewModel extends StateNotifier<EmailFriendAddModel?> {
  Ref ref;
  EmailFriendAddViewModel(super.state, this.ref);
  Future<void> notifyInit(EmailFrinedAddRequestDTO emailFrinedAddRequestDTO) async {
    ResponseDTO responseDTO = await UserRepository().fetchEmailFriendAdd(emailFrinedAddRequestDTO);
    state = EmailFriendAddModel(emailFrinedAddRequestDTO);
  }
}

// // 프로바이더
// final EmailFriendAddProvider =
//     StateNotifierProvider((ref) {
//
//     });

