import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/widgets/find/find_button_form_field.dart';
import 'package:team3_kakao/ui/widgets/find/find_text_form_field.dart';
import 'package:team3_kakao/ui/widgets/join/join_text_form_field.dart';

import '../../../widgets/join/contry_code_picker.dart';
import '../../../widgets/my_info/my_info_text_form_field.dart';

class FindAccountPage extends StatefulWidget {
  const FindAccountPage();

  @override
  State<FindAccountPage> createState() => _FindAccountScreenState();
}

class _FindAccountScreenState extends State<FindAccountPage> {
  // const FindAccountPage({super.key});
  String selectedCountryCode = '+82';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(mediumGap),
        child: ListView(
          children: [
            LogoText(text: "kakao"),
            JoinTitle(
              text: "전화번호로 계정을 찾습니다.",
            ),
            FindHintText(
                text: "카카오 서비스에서 사용한 카카오톡의 전화번호 또는 연락처에 등록한 전화번호를 입력주세요."),
            CountryCodePicker(
              selectedCountryCode: selectedCountryCode,
              onCountryCodeSelected: (newCode) {
                _updateSelectedCountryCode(newCode);
              },
            ),
            InfoAccountInsertText(text: "전화번호"),
            FindButton(text: "카카오계정 찾기")
          ],
        ),
      ),
    );
  }

  void _updateSelectedCountryCode(String newCode) {
    setState(() {
      selectedCountryCode = newCode;
    });
  }
}

class InfoAccountInsertText  extends StatelessWidget {
  final String text;
  final TextEditingController? textController; //textController 연결


  InfoAccountInsertText( {required this.text, this.textController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
          hintText: "$text", hintStyle: TextStyle(color: basicColorB9)),
    );
  }
}
