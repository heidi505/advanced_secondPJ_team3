import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friends_plus_add.dart';
import 'package:team3_kakao/ui/widgets/join/contry_code_picker.dart';

class FriendsPlusAddPage extends StatefulWidget {
  const FriendsPlusAddPage();

  @override
  State<FriendsPlusAddPage> createState() => _FriendsPlusAddState();
}

class _FriendsPlusAddState extends State<FriendsPlusAddPage> {
  // const FindAccountPage({super.key});
  String selectedCountryCode = '+82';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("연락처로 추가"),
        actions: [
          IconButton(
            icon: Icon(Icons.check), // 확인 아이콘 사용 (다른 아이콘을 사용하려면 변경 가능)
            onPressed: () {
              // 확인 버튼이 눌렸을 때 수행할 동작 추가
              // 친구 추가?
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(mediumGap),
        child: ListView(
          children: [
            // 등록할 친구 이름
            InsertAddName(text: "친구이름"),
            Row(
              children: [
                // 전화번호 국가 코드
                Expanded(
                  flex: 35,
                  child: CountryCodePicker(
                    selectedCountryCode: selectedCountryCode,
                    onCountryCodeSelected: (newCode) {
                      _updateSelectedCountryCode(newCode);
                    },
                  ),
                ),
                Expanded(
                  // 전화번호
                  flex: 65,
                  child: InsertAddPhone(text: "전화번호"),
                ),
              ],
            ),
            AddHintText(text: "-없이 숫자만 입력해 주세요"),
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
