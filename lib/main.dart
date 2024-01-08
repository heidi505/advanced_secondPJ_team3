import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/ui/pages/chatting/chatting_list_page.dart';
import 'package:team3_kakao/ui/pages/user/login/login_page.dart';

import '_core/constants/move.dart';
import '_core/constants/theme.dart';
import 'ui/pages/splash_page.dart';

import 'firebase_options.dart';

// TODO 1: Widget이 아닌 곳에서 현재 화면의 context에 접근해주는 객체
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChattingPage(),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Move.chattingScreen,
      routes: getRouters(),
      theme: theme(),
    );
  }
}
