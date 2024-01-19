import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/chat_room/chat_menu/chat_menu_profile_page.dart';

class InfoText extends StatelessWidget {
  String text;

  InfoText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: smallGap, bottom: smallGap),
      child: Text("$text", style: TextStyle(fontSize: 13, color: basicColorB7)),
    );
  }
}

class FormLineText extends StatelessWidget {
  String text;

  FormLineText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 전체 너비를 차지하도록 설정
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1.0, color: formColor)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child:
            Text("$text", style: TextStyle(fontSize: 13, color: basicColorB7)),
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  String text;

  BoldText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
    );
  }
}

class LogoutButton extends StatelessWidget {
  String text;

  LogoutButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: TextButton(
        onPressed: () {},
        child: Text("$text"),
      ),
    );
  }
}

// 채팅방 설정 - 채팅방 이미지 설정
class ChatSettingsProfile extends StatelessWidget {
  const ChatSettingsProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 125,
          width: 125,
          child: Container(
            child: Stack(
              children: [
                // 각 포지션마다 유저 프로필 들어감.
                Positioned(
                  top: smallGap,
                  left: smallGap,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/catdog.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: smallGap,
                  right: smallGap,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/cat.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: smallGap,
                  left: smallGap,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/images/basic_img.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: smallGap,
                  right: smallGap,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "assets/images/dog.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // 유저프로필 대신 원하는 프사로 바꿀수 있음.
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(16),
                            backgroundColor: basicColorW,
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "프로필 사진 등록",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  SetChatProfileImg(
                                      text: "앨범에서 사진 선택", action: ''),
                                  SetChatProfileImg(text: "사진 촬영", action: ''),
                                  SetChatProfileImg(
                                      text: "기본 이미지 설정", action: ''),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/icons/chat_menu_icon_02.png",
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SetChatProfileImg extends StatelessWidget {
  String text;
  Object action;

  SetChatProfileImg({required this.text, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: smallGap),
      child: GestureDetector(
          onTap: () {
            //여기에 실행될 액션을 넣어야함
            // 1. 앨범에서 사진 선택, 2. 사진촬영, 3. 커스텀 프로필 만들기
          },
          child: Container(
              child: Row(
            children: [
              Text("$text"),
            ],
          ))),
    );
  }
}
