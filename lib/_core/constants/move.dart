import 'package:flutter/material.dart';

import 'package:team3_kakao/ui/pages/chat_room/chat_room_page.dart';
import 'package:team3_kakao/ui/pages/chatting/chatting_page.dart';
import 'package:team3_kakao/ui/pages/main_page.dart';
import 'package:team3_kakao/ui/pages/splash_page.dart';

import '../../ui/pages/user/login/login_page.dart';


class Move {
  // splash
  static String splashPage = "/splash";

  // main
  static String mainPage = "/main";

  // chat
  static String chatRoomPage = "/chatRoomPage";

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

    // main
    Move.mainPage: (context) => const MainPage(),

    // auth
    Move.loginScreen: (context) => const LoginPage(),
    // Move.joinScreen: (context) => const JoinScreen(),

    Move.chattingScreen: (context) => const ChattingPage()
  };
}
