import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/size.dart';

class NotifyTextField extends StatelessWidget {
  const NotifyTextField({
    super.key,
    required TextEditingController textEditingController,
  }) : _textEditingController = textEditingController;

  final TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(smallGap),
      child: Container(
        child: TextField(
          controller: _textEditingController ,
          decoration: InputDecoration(
            hintText: "멤버들과 공유하고 싶은 소식을 남겨보세요.",
            border: InputBorder.none,// 밑줄 없애기
          ),
        ),
      ),
    );
  }
}
