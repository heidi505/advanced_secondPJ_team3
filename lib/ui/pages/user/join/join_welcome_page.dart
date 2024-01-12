import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team3_kakao/ui/widgets/join/join_text_form_field.dart';

import '../../../../_core/constants/size.dart';
import '../../../widgets/join/join_button_form_field.dart';

class JoinWelcomePage extends StatelessWidget {
  JoinWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(mediumGap),
        child: Column(
          children: [
            WelcomeTitle(text: "환영합니다!"),
            WelcomeText(text: "카카오게정 가입이 완료되었습니다."),
            WelcomeText(text: "카카오계정으로 다양한 서비스를 편리하게 이용해 보세요!"),
            Padding(
              padding: const EdgeInsets.only(top: xlargeGap, bottom: smallGap),
              child: SvgPicture.asset(
                "assets/icons/info_icon.svg",
                height: 70,
                width: 70,
              ),
            ),
            WelcomeText2(text: "wildlegion59@gmail.com"),
            WelcomeText3(text: "닉네임을뭘로할지몰라서최대글자로"),
            Spacer(),
            MainScreenButton(
              text: "시작하기",
            ),
          ],
        ),
      ),
    );
  }
}
