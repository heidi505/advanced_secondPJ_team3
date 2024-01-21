import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/data/provider/Friend_search_provider.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/ui/pages/friends/friends_add_view_model.dart';

class AddSearchTextFormField extends ConsumerStatefulWidget {
  const AddSearchTextFormField({super.key});

  @override
  _AddSearchTextFormFieldState createState() => _AddSearchTextFormFieldState();
}

class _AddSearchTextFormFieldState
    extends ConsumerState<AddSearchTextFormField> {
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
      onFieldSubmitted: (value) {
        ref.read(searchProvider.notifier).notifyInit("그노");
      },
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        hintText: '이름으로 검색',
        hintStyle: TextStyle(color: formColor),
        filled: true,
        fillColor: formColor.withOpacity(0.2),
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
