import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/dto/user_dto/phone_num_response_dto.dart';
import 'package:team3_kakao/data/dto/user_requestDTO.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';
import 'package:team3_kakao/main.dart';

import 'my_info_page.dart';

class PhoneNumModel {
  //서버랑 화면을 연결시켜주기 위한 필드
  PhoneNumResponseDTO dto;

  PhoneNumModel(this.dto);
}

//2. 뷰모델
class PhoneNumModelViewModel extends StateNotifier<PhoneNumModel?> {
  Ref ref;
  final mContext = navigatorKey.currentContext;

  PhoneNumModelViewModel(this.ref, super._state);

  Future<void> notifyPhoneUpdate(
      PhoneNumUpdateDTO phoneNumUpdateDTO, String jwt) async {
    ResponseDTO responseDTO =
        await UserRepository().fetchPhoneNumUpdate(phoneNumUpdateDTO, jwt);

    if (responseDTO.success == true) {
      ref.read(sessionProvider).user!.phoneNum = responseDTO.data.newPhoneNum;
      Navigator.push(
          mContext!, MaterialPageRoute(builder: (context) => MyInfoPage()));
    }
  }
}

//3. 창고관리자
final phoneNumUpdateProvider =
    StateNotifierProvider<PhoneNumModelViewModel, PhoneNumModel?>((ref) {
  return PhoneNumModelViewModel(ref, null);
});
