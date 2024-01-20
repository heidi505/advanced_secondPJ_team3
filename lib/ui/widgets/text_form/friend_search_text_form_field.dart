import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/data/provider/Friend_search_provider.dart';

class FriendSearchTextFormField extends ConsumerStatefulWidget {
  const FriendSearchTextFormField({super.key});

  @override
  ConsumerState<FriendSearchTextFormField> createState() =>
      _FriendSearchTextFormFieldState();
}

class _FriendSearchTextFormFieldState extends ConsumerState<FriendSearchTextFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        Logger().d("값 들어옴 value = $value");
        ref.read(searchProvider.notifier).updateSearchKeyword(value);
        ref.read(searchProvider.notifier).notifyInit();
        Logger().d("value = $value");
      },
      style: TextStyle(fontSize: 14.0),
      decoration: InputDecoration(
        fillColor: Color(0xFFF1F1F2),
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
        hintText: "검색어를 입력해주세요.",
        hintStyle: TextStyle(
          color: Color(0xFF6C6A6B),
          fontSize: 14.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color:  Color(0xFFF1F1F2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color:  Color(0xFFF1F1F2)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color:  Color(0xFFF1F1F2)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color:  Color(0xFFF1F1F2)),
        ),
      ),
    );
  }
}
