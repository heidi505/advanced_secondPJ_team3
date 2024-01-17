import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';

class CountryCodePicker extends StatelessWidget {
  final String selectedCountryCode;
  final Function(String) onCountryCodeSelected;

  CountryCodePicker({
    required this.selectedCountryCode,
    required this.onCountryCodeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: selectedCountryCode,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // 포커스가 있을 때의 선 색상
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: bgAndLineColor), // 포커스가 없을 때의 선 색상
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return _buildCountryCodeList(context);
          },
        );
      },
    );
  }

  Widget _buildCountryCodeList(BuildContext context) {
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
    List<Widget> countryTiles = countryCodes.map((String code) {
      return _buildCountryCodeTile(context, code);
    }).toList();
    return SingleChildScrollView(
      child: Column(
        children: countryTiles,
      ),
    );
  }

  Widget _buildCountryCodeTile(BuildContext context, String code) {
    return ListTile(
      title: Text(code),
      onTap: () {
        onCountryCodeSelected(code);
        Navigator.of(context).pop();
      },
    );
  }
}
