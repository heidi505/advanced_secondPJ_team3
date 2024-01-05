import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/ui/pages/user/login/login_page.dart';

import '_core/constants/move.dart';
import '_core/constants/theme.dart';
import 'ui/pages/splash_page.dart';

// TODO 1: Widget이 아닌 곳에서 현재 화면의 context에 접근해주는 객체
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashPage(),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Move.splashPage,
      routes: getRouters(),
      theme: theme(),
    );
  }
}
