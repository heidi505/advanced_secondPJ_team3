import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/pages/main_screen.dart';
import 'package:team3_kakao/ui/pages/splash_screen.dart';


class Move {
  // splash
  static String splashScreen = "/splash";

  // main
  static String mainScreen = "/main";

  // auth
  static String loginScreen = "/login";
  static String joinScreen = "/join";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // splash
    Move.splashScreen: (context) => const SplashScreen(),

    // main
    Move.mainScreen: (context) => const MainScreen(),

    // // auth
    // Move.loginScreen: (context) => const LoginScreen(),
    // Move.joinScreen: (context) => const JoinScreen(),
  };
}
