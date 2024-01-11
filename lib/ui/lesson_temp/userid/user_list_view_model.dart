import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/main.dart';
import 'package:team3_kakao/ui/lesson_temp/repository/test_repository.dart';

import '../dto/resp_dto.dart';

class ListModel{
  List<RespDTO> respDTO;

  ListModel(this.respDTO);
}

class ListViewModel extends StateNotifier<ListModel?>{

  Ref ref;
  final mContext = navigatorKey.currentContext!;

  ListViewModel(this.ref, super._state);

  Future<void> notifyList() async {
    ResponseDTO responseDTO = await TestRepository().notifyUserList();

    state = ListModel(responseDTO.data);



  }


}

final listViewProvider = StateNotifierProvider<ListViewModel, ListModel?>((ref){
  List<RespDTO> dtoList = [];
  RespDTO dto = new RespDTO(0, "아무도 없음", "00000");
  dtoList.add(dto);
  return new ListViewModel(ref, new ListModel(dtoList));
});