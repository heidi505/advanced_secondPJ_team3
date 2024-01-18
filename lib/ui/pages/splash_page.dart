import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/data/model/user_mock.dart';

import 'package:team3_kakao/ui/pages/chat_notify/chat_notify_page.dart';

import 'package:team3_kakao/ui/lesson_temp/userid/map_test_page.dart';
import 'package:team3_kakao/ui/lesson_temp/userid/user_id_page.dart';
import 'package:team3_kakao/ui/lesson_temp/userid/user_list_page.dart';

import 'package:team3_kakao/ui/pages/chat_room/chat_room_page.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/my_chat.dart';

import 'package:team3_kakao/ui/pages/chatting/chatting_list_page.dart';
import 'package:team3_kakao/ui/pages/friends/friends_page.dart';
import 'package:team3_kakao/ui/pages/notify_write/notify_write_page.dart';
import 'package:team3_kakao/ui/pages/user/find/find_account_page.dart';
import 'package:team3_kakao/ui/pages/user/find/find_password_page.dart';
import 'package:team3_kakao/ui/pages/user/find/find_password_reset_page.dart';
import 'package:team3_kakao/ui/pages/user/join/join_check_page.dart';
import 'package:team3_kakao/ui/pages/user/join/join_welcome_page.dart';

import 'package:team3_kakao/ui/pages/user/login/login_page.dart';
import 'package:team3_kakao/ui/pages/profile/profile_page.dart';

import 'friends/friends_plus_Id_page.dart';
import 'main_page.dart';
import 'my_info/my_info_page.dart';
import 'profile/profile_edit_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>LoginPage()

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: primaryColor01,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/kakao_logo.svg",
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
