import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:team3_kakao/ui/widgets/join/join_text_form_field.dart';

import '../../../_core/constants/color.dart';
import '../../../_core/constants/font.dart';
import '../../../_core/constants/size.dart';
import '../../widgets/chatting_items/chatting_item.dart';
import '../../widgets/join/join_button_form_field.dart';
import '../../widgets/my_info/my_info_button_form_field.dart';
import '../../widgets/my_info/my_info_text_form_field.dart';
import '../chat_room/widgets/my_chat.dart';
import '../chat_room/widgets/other_chat.dart';
import '../chat_room/widgets/time_line.dart';
import '../friends/widgets/friend_sub_title.dart';

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
              _buildPhoneNumberRow(),
              InfoInsertText(text: "전화번호"),
              PhoneHintText(text: "-없이 숫자만 입력해 주세요."),
              MyInfoUpdateButton(text: "확인"),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildPhoneNumberRow() {
  //   return Row(
  //     children: [
  //       DropdownButton<String>(
  //         value: selectedCountryCode,
  //         onChanged: (String? newValue) {
  //           setState(() {
  //             selectedCountryCode = newValue!;
  //           });
  //         },
  //         items: <String>['+82', '+1', '+44', '+81', '+86'] // 국가 코드 목록
  //             .map<DropdownMenuItem<String>>((String value) {
  //           return DropdownMenuItem<String>(
  //             value: value,
  //             child: Text(value),
  //           );
  //         }).toList(),
  //       ),
  //       SizedBox(width: 16),
  //     ],
  //   );
  // }
  Widget _buildPhoneNumberRow() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: selectedCountryCode, // 선택한 코드 값 표시
            ),
            onTap: () {
              _showCountryCodePicker(context); // 드롭다운 버튼 클릭 시 함수 호출
            },
          ),
        ),
      ],
    );
  }

  void _showCountryCodePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: _buildCountryCodeList(),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildCountryCodeList() {
    List<String> countryCodes = [
      '대한민국 +82',
      '미국 +1',
      '캐나다 +1',
      '일본 +81',
      '필리핀 +63',
      '인도 +62',
      '대만 +66',
      '말레이시아 +60',
      '베트남 +84',
      '브라질 +55',
      '사우디아라비아 +966',
      '중국 +86',
      '홍콩 +852',
      '영국 +44',
      '호주 +61',
      '독일 +49',
      '아프카니스탄 + 93',
      '알바니아 +355',
      '알제리아 +213',
      '아메리칸 사모아 +1 684',
      '안도라 +376',
      '앙골라 +244',
      '앵귈라 +1 264',
      '안타르티카 +672',
      '안티구아 바부다 +1 268',
      '아르헨티나 +54',
      '아르메니아 +61',
      '아루바 +297',
      '오스트레일리아 +61',
      '오스트리아 +43',
      '바하마 +1 242',
      '바레인 +973',
      '방글라데시 +880',
      '바르바도스 +1 246',
      '벨라루스 +375',
      '벨기에 +32',
      '벨리즈 +501',
      '베닌 +229',
      '버뮤다 +1 441',
      '부탄 +975',
      '보스니아 헤르체코비나 +387',
      '보츠와나 +267',
      '브라질 +55',
      '영국령 인도양 지역 +246',
      '영국령 버지니아 아일랜드 +1 284',
      '브루나이 +673',
      '불가리아 +359',
      '부르키나 파소 +226',
      '미얀마(버마) +95',
    ]; // 국가 코드 목록

    return countryCodes.map((String code) {
      return _buildCountryCodeTile(code);
    }).toList();
  }

  Widget _buildCountryCodeTile(String code) {
    return ListTile(
      title: Text(code),
      onTap: () {
        _updateSelectedCountryCode(code);
        Navigator.of(context).pop();
      },
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
