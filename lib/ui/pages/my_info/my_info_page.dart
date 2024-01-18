import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';

import '../../../_core/constants/color.dart';
import '../../../_core/constants/size.dart';
import '../../widgets/join/join_button_form_field.dart';
import '../../widgets/my_info/my_info_text_form_field.dart';
import 'my_info_password_page.dart';
import 'my_info_phone_page.dart';

class MyInfoPage extends ConsumerStatefulWidget {
  //const MyInfoPage({super.key});
  const MyInfoPage();

  @override
  _MyInfoScreenState createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends ConsumerState<MyInfoPage> {
  @override
  Widget build(BuildContext context) {
    SessionUser session = ref.read(sessionProvider);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "내 정보 관리",
          ),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            child: Container(
              color: formColor,
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(1.0),
          ),
        ),
        body: Card(
          elevation: 0,
          color: Colors.white,
          margin: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: mediumGap, horizontal: 16),
            child: Column(
              children: [
                _buildProfilePicRow(),
                const SizedBox(height: 50),
                // _buildProfileTextRow(),
                MyInfoText(title: "이메일", text: session.user!.email),
                MyInfoText(title: "닉네임", text: session.user!.nickname),
                TextMenuCard(
                    title: "전화번호",
                    text: session.user!.phoneNum,
                    linkto: MyInfoPhonePage()),
                TextMenuCard(
                    title: "계정 비밀번호 변경",
                    text: "",
                    linkto: MyInfoPasswordPage()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(xmediumGap),
                child: Image.asset("assets/images/basic_img.jpeg"),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: xmediumGap,
                height: xmediumGap,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[100]),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
