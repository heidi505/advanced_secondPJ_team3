import 'package:flutter/material.dart';
import 'package:team3_kakao/data/model/user_mock.dart';

import 'package:team3_kakao/ui/pages/chat_room/chat_room_page.dart';
import 'package:team3_kakao/ui/pages/chatting/chatting_list_page.dart';
import 'package:team3_kakao/ui/pages/main_page.dart';
import 'package:team3_kakao/ui/pages/profile/profile_edit_page.dart';
import 'package:team3_kakao/ui/pages/profile/profile_page.dart';
import 'package:team3_kakao/ui/pages/splash_page.dart';
import 'package:team3_kakao/ui/pages/user/join/join_check_page.dart';
import 'package:team3_kakao/ui/pages/user/join/join_welcome_page.dart';

import '../../ui/pages/user/login/login_page.dart';

class Move {
  // splash
  static String splashPage = "/splash";

  // main
  static String mainPage = "/main";

  // chat
  static String chatRoomPage = "/chatRoomPage";
  static String profilePage = "/profilePage";
  static String profileEditPage = "/profileEditPage";

  // auth
  static String loginScreen = "/login";
  static String joinScreen = "/join";
  static String chattingScreen = "/chatting";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // splash
    Move.splashPage: (context) => const SplashPage(),

    Move.chatRoomPage: (context) => ChatRoomPage(),

    // Move.profilePage: (context) => ProfilePage(
    //
    //     ),

    Move.profilePage: (context) => ProfilePage(
          user: friends[0],
        ),
    Move.profileEditPage: (context) => ProfileEditPage(
          user: friends[0],
        ),


    // main
    Move.mainPage: (context) => const MainPage(),

    // auth
    Move.loginScreen: (context) =>  LoginPage(),
    Move.joinScreen: (context) => const JoinWelcomePage(),


    Move.chattingScreen: (context) => const ChattingPage()
  };
}
