import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/ui/pages/user/find/find_account_check_page.dart';

class InsertAddName extends StatelessWidget {
  String text;

  InsertAddName({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "$text",
        hintStyle: TextStyle(color: basicColorB9),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // 포커스가 있을 때의 선 색상
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: bgAndLineColor), // 포커스가 없을 때의 선 색상
        ),
        suffixIcon: Text(
          '최대 20자',
          style: TextStyle(color: Colors.grey), // 힌트 텍스트의 색상 설정
        ),
      ),
    );
  }
}

class InsertAddPhone extends ConsumerWidget {
  String text;

  InsertAddPhone({required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController? controller = TextEditingController();
    return TextFormField(
      onChanged: (value) {
        ref.read(paramProvider).addPhoneNumForSearch(value);
      },
      decoration: InputDecoration(
        hintText: "$text",
        hintStyle: TextStyle(color: basicColorB9),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // 포커스가 있을 때의 선 색상
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: bgAndLineColor), // 포커스가 없을 때의 선 색상
        ),
      ),
    );
  }
}

class AddHintText extends StatelessWidget {
  String text;

  AddHintText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "$text",
          style: TextStyle(color: basicColorB7),
        ),
      ),
    );
  }
}

class FindButton extends StatelessWidget {
  String text;

  FindButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: largeGap, bottom: xsmallGap),
      child: TextButton(
          onPressed: () {
            // 버튼 클릭 시 join_agree_page.dart로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FindAccountCheckPage()),
            );
          },
          child: Text("$text")),
    );
  }
}
