import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_detail_response_dto/profile_detail_response_dto.dart';
import 'package:team3_kakao/ui/pages/friends/friends_add_view_model.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friends_plus_add.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/round_icon_btn.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';
import 'package:team3_kakao/ui/widgets/join/contry_code_picker.dart';
import 'package:team3_kakao/ui/widgets/login/login_button_form_field.dart';
import 'package:team3_kakao/ui/widgets/login/login_text_form_feild.dart';
import 'package:team3_kakao/ui/widgets/text_form/friend_search_text_form_field.dart';

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
    FriendAddModel? model = ref.watch(friendAddProvier);

    if (model == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("연락처로 추가"),
          actions: [
            IconButton(
              icon: Icon(Icons.check), // 확인 아이콘 사용 (다른 아이콘을 사용하려면 변경 가능)
              onPressed: () async {
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
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("연락처로 추가"),
          actions: [
            IconButton(
              icon: Icon(Icons.check), // 확인 아이콘 사용 (다른 아이콘을 사용하려면 변경 가능)
              onPressed: () async {
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
              SizedBox(
                height: 40,
              ),
              model!.profileDetailResponseDTO!.id != 0
                  ? Container(
                      child: Column(
                        children: [
                          ProfileImage(
                              imagePath:
                                  "$baseUrl/images/${model!.profileDetailResponseDTO!.id}.jpg",
                              imageWidth: 130.0,
                              imageHeight: 130.0,
                              circular: 10.0),
                          SizedBox(height: 10),
                          Text(model!.profileDetailResponseDTO!.nickname),
                          SizedBox(height: 20),
                          FindAccountButton(text: "친구 추가")
                        ],
                      ),
                    )
                  : Center(
                      child: Text("해당하는 유저가 없습니다",
                          style: TextStyle(fontSize: 18.0)))
            ],
          ),
        ),
      );
    }
  }

  void _updateSelectedCountryCode(String newCode) {
    setState(() {
      selectedCountryCode = newCode;
    });
  }
}
