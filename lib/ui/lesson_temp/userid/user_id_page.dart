import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/ui/lesson_temp/dto/req_dto.dart';
import 'package:team3_kakao/ui/lesson_temp/userid/user_id_view_model.dart';

class UserIdTest extends ConsumerWidget {
  //상태관리 위젯
  const UserIdTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserIdModel? model = ref.watch(userIdTestProvider);
    return Center(
      child: TextButton
        (
          onPressed: (){
            //사용자 ID, 닉네임 가진 ReqDTO 객체 생성
            ReqDTO reqDTO = new ReqDTO(1, "최죠");  //얘는 이제 레파지토리에서 서버로 가겠지
            //userIdTestProvider.notifier--> notifyUserId 메서드 호출
            ref.read(userIdTestProvider.notifier).notifyUserId(reqDTO);
          },
          child: Text("다른 유저 닉네임 가져오기 : ${model!.respDTO.userNickname}")),
    );
  }
}
