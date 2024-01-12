//1.모델
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/dto/user_requestDTO.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';
import 'package:team3_kakao/main.dart';

class FindPasswordModel {
  FindPasswordDTO? requestDTO;
  FindPasswordModel(this.requestDTO);
}

//2. 뷰모델
class FindPasswordViewModel extends StateNotifier<FindPasswordModel?>{
  Ref ref;
  final mContext = navigatorKey.currentContext;

  FindPasswordViewModel(this.ref, super._state);




  
  Future<void> notifyPassword(FindPasswordDTO requestDTO) async{ //매개변수로 ReqDTO를 레파지토리까지 넘김
    ResponseDTO responseDTO = await UserRepository().fetchPasswordCheck(requestDTO);
    state = FindPasswordModel(responseDTO.data);
  }

  void notifyInit() {}
}

//3. 프로바이더
final findPasswordProvider = StateNotifierProvider<FindPasswordViewModel, FindPasswordModel?>(
        (ref) {
      return FindPasswordViewModel(ref, null)..notifyInit();
    });