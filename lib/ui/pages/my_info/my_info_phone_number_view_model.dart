import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/dto/user_dto/phone_num_response_dto.dart';
import 'package:team3_kakao/data/dto/user_requestDTO.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';
import 'package:team3_kakao/main.dart';

class PhoneNumModel{
  PhoneNumResponseDTO dto;

  PhoneNumModel(this.dto);
}

//2. 뷰모델
class PhoneNumModelViewModel extends StateNotifier<PhoneNumModel?>{
  Ref ref;
  final mContext = navigatorKey.currentContext;

  PhoneNumModelViewModel(this.ref, super._state);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO= new ResponseDTO();
    state = PhoneNumModel(responseDTO.data);
  }

  Future<void> notifyPhoneUpdate(PhoneNumUpdateDTO phoneNumUpdateDTO, String jwt) async{
    //매개변수로 ReqDTO를 레파지토리까지 넘김
    Logger().d("++레파지토리 넘어감 ??++");
    ResponseDTO responseDTO = await UserRepository().fetchPhoneNumUpdate(phoneNumUpdateDTO, jwt);
    state = PhoneNumModel(responseDTO.data);
    Logger().d(state!.dto.newPhoneNum + "여기");
  }
}

//3. 창고관리자
final phoneNumUpdateProvider = StateNotifierProvider<PhoneNumModelViewModel, PhoneNumModel?>(
        (ref) {
      return PhoneNumModelViewModel(ref,null)..notifyInit();
    });