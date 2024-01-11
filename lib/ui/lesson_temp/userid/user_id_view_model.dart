import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/model/user_mock.dart';
import 'package:team3_kakao/main.dart';
import 'package:team3_kakao/ui/lesson_temp/dto/req_dto.dart';
import 'package:team3_kakao/ui/lesson_temp/repository/test_repository.dart';

import '../dto/resp_dto.dart';

class UserIdModel{
  RespDTO respDTO;

  UserIdModel(this.respDTO);
}

class UserIdViewModel extends StateNotifier<UserIdModel?>{
  Ref ref;
  final mContext = navigatorKey.currentContext;

  UserIdViewModel(this.ref, super._state);

  Future<void> notifyInit() async {
    RespDTO respDTO = new RespDTO(0, "하얀", "1111");
    state = UserIdModel(respDTO);
  }

  Future<void> notifyUserId(ReqDTO reqDTO) async{
    ResponseDTO responseDTO = await TestRepository().notifyuserId(reqDTO);
    state = UserIdModel(responseDTO.data);
  }
}

final userIdTestProvider = StateNotifierProvider<UserIdViewModel, UserIdModel?>(
        (ref) {
          return UserIdViewModel(ref, null)..notifyInit();
        });