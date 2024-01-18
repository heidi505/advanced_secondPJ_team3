import 'package:flutter/material.dart';
import 'package:team3_kakao/data/model/user_mock.dart';
import 'package:team3_kakao/ui/pages/chat_notify/chat_notify_page.dart';

import 'package:team3_kakao/ui/pages/chat_room/chat_room_page.dart';
import 'package:team3_kakao/ui/pages/chat_room/friend_invite_page.dart';

import 'package:team3_kakao/ui/pages/chatting/chatting_page.dart';

import 'package:team3_kakao/ui/pages/chat_room/vacant_chat_room_page.dart';
import 'package:team3_kakao/ui/pages/chatting/chat_name_set_page.dart';
import 'package:team3_kakao/ui/pages/chatting/chatting_list_page.dart';
import 'package:team3_kakao/ui/pages/main_page.dart';
import 'package:team3_kakao/ui/pages/my_info/my_info_page.dart';
import 'package:team3_kakao/ui/pages/notify_write/notify_write_page.dart';
import 'package:team3_kakao/ui/pages/profile/profile_edit_page.dart';
import 'package:team3_kakao/ui/pages/profile/profile_page.dart';
import 'package:team3_kakao/ui/pages/splash_page.dart';
import 'package:team3_kakao/ui/pages/user/find/find_password_page.dart';
import 'package:team3_kakao/ui/pages/user/find/find_password_reset_page.dart';
import 'package:team3_kakao/ui/pages/user/join/join_check_page.dart';
import 'package:team3_kakao/ui/pages/user/join/join_password_page.dart';
import 'package:team3_kakao/ui/pages/user/join/join_profile_page.dart';
import 'package:team3_kakao/ui/pages/user/join/join_welcome_page.dart';

import '../../ui/pages/user/login/login_page.dart';

class Move {
  // splash
  static String splashPage = "/splash";

  // main
  static String mainPage = "/main";

  // chat
  static String chatRoomPage = "/chatRoomPage";
  static String chatNameSetPage = "/chatNameSetPage";
  static String profilePage = "/profilePage";
  static String profileEditPage = "/profileEditPage";
  static String joinProfilePage = "/joinProfilePage";
  static String joinWelcomePage = "/joinWelcomePage";
  static String chatNotifyPage = "/chatNotifyPage";
  static String NotifyWritePage = "/NotifyWritePage";
  static String vacantChatRoomPage = "/vacantChatRoomPage";
  static String friendInvitePage = "/friendInvitePage";

  // auth
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String chattingPage = "/chatting";
  static String joinPasswordPage = "/joinPasswordPage";
  static String findPasswordPage = "/findPasswordPage";
  static String findPasswordReset = "/findPasswordResetPage";
  static String myInfoPage = "/myInfoPage";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // splash
    Move.splashPage: (context) => const SplashPage(),

    // chat
    Move.chatRoomPage: (context) => ChatRoomPage(),

    Move.chatNotifyPage: (context) => ChatNotifyPage(),
    Move.chatNameSetPage: (context) => ChatNameSetPage(),

    Move.NotifyWritePage: (context) => NotifyWritePage(),

    Move.vacantChatRoomPage: (context) => VacantChatRoomPage(),

    Move.profilePage: (context) => ProfilePage(),
    Move.profileEditPage: (context) => ProfileEditPage(
          user: friends[0],
        ),

    Move.friendInvitePage: (context) => FriendInvitePage(),
    Move.joinProfilePage: (context) => JoinProfilePage(),
    Move.joinWelcomePage: (context) => JoinWelcomePage(),

    Move.joinPasswordPage: (context) => JoinPassWordPage(),

    Move.findPasswordPage: (context) => FindPasswordPage(),
    Move.findPasswordReset: (context) => FindPasswordReset(),

    Move.myInfoPage: (context) => MyInfoPage(),

    // main
    Move.mainPage: (context) => MainPage(),

    // auth

    Move.loginPage: (context) => LoginPage(),
    Move.joinPage: (context) => JoinWelcomePage(),
  };
}
