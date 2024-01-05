import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/chat_icon_button.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/my_chat.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/other_chat.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/time_line.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage();

  @override
  State<ChatRoomPage> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomPage> {
  final List<MyChat> chats = [];
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor02,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "홍길동",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          actions: [
            Icon(FontAwesomeIcons.searchengin, size: 30),
            SizedBox(width: 25),
            Icon(FontAwesomeIcons.bars, size: 20),
            SizedBox(width: 25),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      TimeLine(time: "2021년 1월 1일 금요일"),
                      OtherChat(
                        name: "홍길동",
                        text: "새해 복 많이 받으세요",
                        time: "오전 10:10분",
                      ),
                      MyChat(
                        text: "선생님도 많이 받으십시오",
                        time: "오후 2:15",
                      ),
                      ...List<Widget>.generate(
                          chats.length, (index) => chats[index])
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    width: smallGap,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (context) {
                          return Container(
                            color: Colors.transparent,
                            child: Text("dd"),
                          );
                        },
                      );
                    },
                    child: Image.asset(
                      "assets/icons/plus_icon.png",
                      fit: BoxFit.cover,
                      width: 35,
                      height: 35,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(30), // border-radius 값 조절
                        border: Border.all(
                          color: Colors.grey, // 테두리 색상
                        ),
                      ),
                      child: TextFormField(
                        controller: _textController,
                        maxLines: 1,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          suffix: Container(
                            width: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/icons/chat_smile_icon.png",
                                  fit: BoxFit.cover,
                                  width: 30,
                                  height: 30,
                                  color: basicColorB9,
                                ),
                                SizedBox(
                                  width: smallGap,
                                ),
                                Image.asset(
                                  "assets/icons/hash_icon.png",
                                  fit: BoxFit.cover,
                                  width: 30,
                                  height: 30,
                                  color: basicColorB9,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: smallGap,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
