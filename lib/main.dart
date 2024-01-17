import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:team3_kakao/ui/pages/chatting/chatting_page.dart';

import 'package:team3_kakao/ui/pages/chatting/chatting_list_page.dart';

import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/theme.dart';
import 'package:team3_kakao/ui/pages/profile/profile_page.dart';
import 'package:team3_kakao/ui/pages/splash_page.dart';
import 'package:team3_kakao/ui/pages/user/login/login_page.dart';
import '_core/constants/move.dart';
import '_core/constants/theme.dart';
import '_core/handler/permission_manager.dart';
import 'ui/pages/splash_page.dart';
import '_core/firebase/firebase_options.dart';

// TODO 1: Widget이 아닌 곳에서 현재 화면의 context에 접근해주는 객체
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//   // 권한 요청 및 결과 처리
  bool hasPermissions = await PermissionManager.requestPermissions();

  if (hasPermissions) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(ProviderScope(child: const MyApp()));
  } else {
    // 권한이 거부된 경우 처리
    // 예를 들어 사용자에게 권한이 필요하다는 다이얼로그를 표시하거나 다른 조치를 취할 수 있습니다.
  }
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
