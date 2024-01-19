import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';

class FriendSearchTextFormField extends StatefulWidget {
  const FriendSearchTextFormField({super.key});

  @override
  State<FriendSearchTextFormField> createState() =>
      _FriendSearchTextFormFieldState();
}

class _FriendSearchTextFormFieldState extends State<FriendSearchTextFormField> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isTextNotEmpty = false;

  void _updateTextStatus() {
    setState(() {
      _isTextNotEmpty = _textEditingController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textEditingController,
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        hintText: '이름으로 검색',
        hintStyle: h5(color: basicColorB9),
        filled: true,
        fillColor: formColor.withOpacity(0.5),
        suffixIcon: _isTextNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _textEditingController.clear();
                  });
                },
              )
            : null,
        contentPadding: EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
