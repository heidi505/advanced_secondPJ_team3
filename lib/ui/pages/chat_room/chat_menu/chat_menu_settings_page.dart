import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/chat_menu_sub.dart';
import 'package:team3_kakao/ui/widgets/find/find_button_form_field.dart';

class ChatRoomSettingsPage extends StatelessWidget {
  const ChatRoomSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("채팅방 설정"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              top: smallGap,
              left: mediumGap,
              right: mediumGap,
              bottom: xsmallGap),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChatSettingsProfile(),
              SizedBox(height: 30),
              BoldText(text: "채팅방 이름"),
              InfoText(text: "심화반 2차 3조"),
              SizedBox(height: 20),
              InfoText(text: "내가 설정한 사진과 이름은 나에게만 보입니다"),
              SizedBox(height: 20),
              FormLineText(text: "채팅방 관리"),
              BoldText(text: "대화 내용 모두 삭제"),
              SizedBox(height: 20),
              FormLineText(
                text: "채팅방 용량 관리",
              ),
              BoldText(text: "사진 데이터 삭제"),
              // 용량은 실제 캐시데이터에서 긁어 오는건가?
              InfoText(text: "사진 데이터 용량"),
              BoldText(text: "전체 데이터 삭제"),
              // 용량은 실제 캐시데이터에서 긁어 오는건가? 지식이 부족하다...
              InfoText(text: "전체 데이터 용량"),
              Spacer(),
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1.0, color: formColor))),
                  child: LoginButton(text: "채팅방 나가기")),
            ],
          ),
        ),
      ),
    );
  }
}