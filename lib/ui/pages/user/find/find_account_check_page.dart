import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/widgets/find/find_button_form_field.dart';
import 'package:team3_kakao/ui/widgets/find/find_text_form_field.dart';

class FindAccountCheckPage extends StatelessWidget {
  const FindAccountCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(mediumGap),
        child: ListView(
          children: [
            FindTitle(text: "입력한 정보와 일치하는 \n카카오계정을 확인해 주세요."),
            FindHintText2(
                text: "개인정보 보호를 위해 직접 입력하지 않은 정보의 경우 일부를 *로 표시하였습니다."),
            FindHintText2(text: "카카오계정에 로그인 할 수 있는 이메일 및 전화번호가 표시됩니다."),
            InfoText(text: "wi*******@naver.com"),
            Text("+82 10-3108-3000"),
            FindPasswordButton(password: "비밀번호 재설정"),
            LoginButton(text: "로그인"),
          ],
        ),
      ),
    );
  }
}
