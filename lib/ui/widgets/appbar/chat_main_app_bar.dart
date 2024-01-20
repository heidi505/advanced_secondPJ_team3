import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/model/user_mock.dart';
import 'package:team3_kakao/ui/pages/friends/friends_plus_Id_page.dart';
import 'package:team3_kakao/ui/pages/friends/friends_plus_add_Page.dart';
import 'package:team3_kakao/ui/pages/friends/friends_plus_main_page.dart';

class ChattingMainAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  String title;
  String imagePathL;
  String imagePathR;

  ChattingMainAppBar({
    required this.title,
    required this.imagePathL,
    required this.imagePathR,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title),
            SizedBox(width: 16),
          ],
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            imagePathL,
            fit: BoxFit.cover,
            width: 25,
            height: 25,
          ),
        ),
        SizedBox(
          width: xsmallGap,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return FriendsPlusMainPage(); // 투명한 배경을 가진 새로운 위젯
              },
            );
          },
          child: SvgPicture.asset(
            imagePathR,
            fit: BoxFit.cover,
            width: 25,
            height: 25,
          ),
        ),
        SizedBox(
          width: mediumGap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
