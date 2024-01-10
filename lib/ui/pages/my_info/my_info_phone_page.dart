import 'package:flutter/material.dart';

import '../../../_core/constants/color.dart';
import '../../../_core/constants/size.dart';
import '../../widgets/join/contry_code_picker.dart';
import '../../widgets/my_info/my_info_button_form_field.dart';
import '../../widgets/my_info/my_info_text_form_field.dart';

class MyInfoPhonePage extends StatefulWidget {
  // const MyInfoPage({super.key});
  const MyInfoPhonePage();

  @override
  State<MyInfoPhonePage> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoPhonePage> {
  String selectedCountryCode = '+82'; // 초기값 설정

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "전화번호 변경",
          ),
          bottom: PreferredSize(
            child: Container(
              color: formColor,
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(1.0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(mediumGap),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoTitle(text: "새로운 전화번호를 입력하세요."),
              PhoneHintText(
                  text: "카카오톡에 등록된 전화번호를 변경하고, 새로운 전화번호로 카카오계정을 이용합니다."),
              // InfoInsertText(text: "대한민국 +82"),
              CountryCodePicker(
                selectedCountryCode: selectedCountryCode,
                onCountryCodeSelected: (newCode) {
                  _updateSelectedCountryCode(newCode);
                },
              ),
              InfoInsertText(text: "전화번호"),
              PhoneHintText(text: "-없이 숫자만 입력해 주세요."),
              MyInfoUpdateButton(text: "확인"),
            ],
          ),
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

class InfoInsertText extends StatelessWidget {
  String text;

  InfoInsertText({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "$text", hintStyle: TextStyle(color: basicColorB9)),
    );
  }
}