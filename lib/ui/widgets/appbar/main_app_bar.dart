import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team3_kakao/_core/constants/size.dart';

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
        InkWell(
          onTap: () {},
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
