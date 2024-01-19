import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/friends/friends_add_view_model.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friends_plus_add.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';
import 'package:team3_kakao/ui/widgets/join/contry_code_picker.dart';

class FriendsPlusAddPage extends ConsumerStatefulWidget {
  const FriendsPlusAddPage();

  @override
  _FriendsPlusAddState createState() => _FriendsPlusAddState();
}

class _FriendsPlusAddState extends ConsumerState<FriendsPlusAddPage> {
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
              ref.read(friendAddProvier.notifier).fetchSearchingFriend();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(mediumGap),
        child: ListView(
          children: [
            // 등록할 친구 이름
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
