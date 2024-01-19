import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/notify_write/notify_write_view_model.dart';
import 'package:team3_kakao/ui/pages/notify_write/widgets/notify_text_field.dart';
import 'package:team3_kakao/ui/pages/notify_write/widgets/notify_write_app_bar.dart';


class NotifyWritePage extends ConsumerStatefulWidget {

  @override
  _NotifyWritePageState createState() => _NotifyWritePageState();
}

class _NotifyWritePageState extends ConsumerState<NotifyWritePage> {
  final _formKey = GlobalKey<FormState>();
  bool? _isNotify = false; //체크 박스 변수 선언 -- > false 초기화
  TextEditingController _textEditingController = TextEditingController();

//1. textField --> 컨트롤러 연결 ok
  //2. 완료 버튼 --> 제출

  @override
  Widget build(BuildContext context) {
    SessionUser session = ref.read(sessionProvider);
    NotifyChatWriteModel? model  = ref.watch(chatNotifyWriteProvider);
    ParamStore paramStore = ref.read(paramProvider);
    if (session == null) {
      return CircularProgressIndicator();
    }
    return Form(
      key: _formKey,//서버로 보낼때 식별되는 고유 키
      child: Scaffold(
        appBar: NotifyWirteAppBar( textEditingController: _textEditingController,),

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
                    value: _isNotify, //여기에 값을 받네
                    onChanged: (value) {//색깔 변함 함수
                      setState(() {//setState (컴포넌트로 안빠짐)
                        //위젯 상태를 변경하고 변경된 상태를 화면에 반영
                        _isNotify = value ?? false;
                        //value ==null이면 false
                        //여기의 true 값을 넘기려면 ??
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
              NotifyTextField(
                  textEditingController: _textEditingController,

              ),
            ],
          ),
        ),
      ),
    );
  }


}


