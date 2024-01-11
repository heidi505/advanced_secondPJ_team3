import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/notify_write/widgets/notify_text_field.dart';
import 'package:team3_kakao/ui/pages/notify_write/widgets/notify_write_app_bar.dart';

class NotifyWritePage extends StatefulWidget {
  NotifyWritePage({super.key});

  @override
  State<NotifyWritePage> createState() => _NotifyWritePageState();
}

class _NotifyWritePageState extends State<NotifyWritePage> {
  bool? _isNotify = false; //체크 박스 변수 선언
  TextEditingController _textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotifyWirteAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Checkbox(
                  //공지 저장 버튼
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  value: _isNotify,
                  onChanged: (value) {
                    setState(() {//setState -> 컴포넌트로 안빠짐
                      _isNotify = value ?? false;
                    });
                  },
                  activeColor: primaryColor01,
                ),
                Text("공지"),
              ],
            ),
            Container(
              height: 1,
                color: disableColor,
            ),
            NotifyTextField(textEditingController: _textEditingController),
          ],
        ),
      ),
    );
  }
}

