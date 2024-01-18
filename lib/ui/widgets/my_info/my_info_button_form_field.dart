import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/dto/user_requestDTO.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/my_info/my_info_page.dart';

import '../../../_core/constants/size.dart';
import '../../pages/my_info/my_info_phone_number_view_model.dart';
import '../../pages/user/join/join_password_page.dart';

class MyInfoUpdateButton extends ConsumerWidget {
  final String text;
  final TextEditingController? phoneNumController;

  MyInfoUpdateButton({required this.text, this.phoneNumController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PhoneNumModel? model = ref.read(phoneNumUpdateProvider);
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: TextButton(
        onPressed: () {
          SessionUser sessionUser = ref.read(sessionProvider);
          PhoneNumUpdateDTO phoneNumUpdateRequestDTO =
              new PhoneNumUpdateDTO(phoneNum: '${phoneNumController?.text}');
          Logger().d("전화번호 제출 준비 : ${phoneNumController?.text}");
          ref.read(phoneNumUpdateProvider.notifier).notifyPhoneUpdate(
              PhoneNumUpdateDTO(phoneNum: '${phoneNumController?.text}'),
              sessionUser.jwt!);
          // 버튼 클릭 시 join_agree_page.dart로 이동
        },
        child: Text("$text"),
      ),
    );
  }
}
