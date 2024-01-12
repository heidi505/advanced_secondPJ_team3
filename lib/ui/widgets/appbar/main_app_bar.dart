import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/friends/friends_plus_Id_page.dart';
import 'package:team3_kakao/ui/pages/friends/friends_plus_add_Page.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  String imagePathL;
  String imagePathR;

  MainAppBar(
      {required this.title,
      required this.imagePathL,
      required this.imagePathR});

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
            _showFriendsPlusModal(context);
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
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class FriendsPlusIcon extends StatelessWidget {
  String text;
  Widget? linkto;
  String svg;

  FriendsPlusIcon(
      {required this.text, required this.linkto, required this.svg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => linkto!));
      },
      child: Container(
          child: Column(
        children: [
          SvgPicture.asset(
            "$svg",
            width: 25,
            height: 25,
          ),
          Text("$text"),
        ],
      )),
    );
  }
}

_showFriendsPlusModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FriendsPlusIcon(
                  text: "QR 코드", linkto: null, svg: "assets/icons/qr_icon.svg"),
              FriendsPlusIcon(
                text: "연락처로 추가",
                linkto: FriendsPlusAddPage(),
                svg: "assets/icons/contact_icon.svg",
              ),
              FriendsPlusIcon(
                text: "ID로 추가",
                linkto: FriendsPlusIdPage(),
                svg: "assets/icons/id_add_icon.svg",
              ),
              FriendsPlusIcon(
                text: "추천 친구",
                linkto: null,
                svg: "assets/icons/friend_add_icon.svg",
              ),
            ],
          ),
        ),
      );
    },
  );
}
