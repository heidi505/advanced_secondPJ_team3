import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/_core/utils/date_format.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/chat_menu_icon.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/my_chat.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/other_chat.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/time_line.dart';

class ChatRoomPage extends StatefulWidget {
  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final List<MyChat> chats = [];
  final TextEditingController _textController = TextEditingController();
  double bottomInset = 0.0;
  bool isPopupVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor02,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "김하얀",
          style: h3(),
        ),
      ),
      endDrawer: Drawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TimeLine(time: getCurrentDay()),
                    SizedBox(
                      height: mediumGap,
                    ),
                    const OtherChat(
                      name: "홍길동",
                      text: "새해 복 많이 받으세요.",
                      time: "오전 10:10",
                    ),
                    SizedBox(
                      height: mediumGap,
                    ),
                    MyChat(
                      text: "선생님도 많이 받으십시오.",
                      time: "오후 2:15",
                    ),
                    SizedBox(
                      height: mediumGap,
                    ),
                    const OtherChat(
                      name: "홍길동",
                      text: "새해 복 많이 받으세요.",
                      time: "오전 10:10",
                    ),
                    SizedBox(
                      height: mediumGap,
                    ),
                    ...List.generate(chats.length, (index) => chats[index]),
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
                    setState(() {
                      isPopupVisible = !isPopupVisible; // 클릭할 때마다 반전
                    });
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
                    child: TextField(
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
                      onSubmitted: _handleSubmitted,
                    ),
                  ),
                ),
                SizedBox(
                  width: smallGap,
                ),
              ],
            ),
          ),
          Visibility(
            visible: isPopupVisible,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: basicColorW),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_01.png",
                                text: "앨범",
                                onTap: () {},
                              ),
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_02.png",
                                text: "카메라",
                              ),
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_03.png",
                                text: "일정",
                              ),
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_04.png",
                                text: "지도",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_05.png",
                                text: "연락처",
                              ),
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_06.png",
                                text: "파일",
                              ),
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_07.png",
                                text: "캡쳐",
                              ),
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_08.png",
                                text: "송금",
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(text) {
    _textController.clear(); // 1

    setState(() {
      // 2
      chats.add(MyChat(
        text: text,
        time: getCurrentTime(),
      ));
    });
  }
}
