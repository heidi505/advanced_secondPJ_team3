import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/pages/main_page.dart';
import 'package:team3_kakao/ui/pages/splash_page.dart';

class Move {
  // splash
  static String splashPage = "/splash";

  // main
  static String mainPage = "/main";

  // auth
  static String loginScreen = "/login";
  static String joinScreen = "/join";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // splash
    Move.splashPage: (context) => const SplashPage(),

    // main
    Move.mainPage: (context) => const MainPage(),

    // // auth
    // Move.loginScreen: (context) => const LoginScreen(),
    // Move.joinScreen: (context) => const JoinScreen(),
  };
}
