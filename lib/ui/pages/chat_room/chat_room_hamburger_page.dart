import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team3_kakao/_core/constants/color.dart';

import '../../../_core/constants/size.dart';
import '../../widgets/chatting_items/chatting_hamburger.dart';

class ChatRoomHamburger extends StatelessWidget {
  const ChatRoomHamburger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: mediumGap, left: smallGap),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoldTtitle(text: "채팅방 서랍"),
                    ChatHamIcon(
                        text: "사진/동영상", svg: "assets/icons/chat_pic_icon.svg"),
                    // 실제 보유 이미지들 + 리스트로(?) 가져오게 수정해야함!
                    Container(
                      height: 90,
                      child: Row(
                        children: [
                          Image.asset("assets/images/cat.jpg",
                              fit: BoxFit.cover, height: 70, width: 70),
                          SizedBox(width: xsmallGap), // 여백을 추가하는 부분
                          Image.asset("assets/images/dog.jpg",
                              fit: BoxFit.cover, height: 70, width: 70),
                        ],
                      ),
                    ),
                    ChatHamIcon(
                        text: "파일", svg: "assets/icons/chat_folder_icon.svg"),
                    ChatHamIcon(
                        text: "링크", svg: "assets/icons/chat_link_icon.svg"),
                    BoldText(text: "톡캘린더"),
                    BoldText(text: "톡게시판"),
                    ChatHamIcon(
                        text: "공지", svg: "assets/icons/chat_notice_icon.svg"),
                    BoldText(text: "대화상대"),
                    // 프로필아이콘으로 추가 수정 해야함
                    PlusUser(
                        text: "대화상대 초대",
                        svg: "assets/icons/chat_plus_icon.svg"),
                    MyProfile(
                        text: "고양이 VS 멍멍이",
                        profilePic: "assets/images/catdog.jpg"),
                    // 리스트로 쭉 나오게 해야함
                    UserList(text: "뽀메", profilePic: "assets/images/dog.jpg"),
                    UserList(text: "냥", profilePic: "assets/images/cat.jpg"),
                    UserList(text: "뽀메2", profilePic: "assets/images/dog.jpg"),
                    UserList(text: "냥2", profilePic: "assets/images/cat.jpg"),
                  ],
                ),
              ),
            ),
          ),
          HamBottomMenu()
        ],
      ),
    );
  }
}
