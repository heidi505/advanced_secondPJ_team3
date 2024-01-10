import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_icon_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/round_icon_btn.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/profile_basic_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Spacer(),
              ProfileImage(
                  imagePath: "assets/images/basic_img.jpeg",
                  imageWidth: 100,
                  imageHeight: 100,
                  circular: 42),
              const SizedBox(
                height: xsmallGap,
              ),
              Text(user.name, style: h4(color: basicColorW)),
              const SizedBox(height: xsmallGap),
              Text(
                user.intro,
                style: h5(color: basicColorW),
              ),
              const SizedBox(
                height: mediumGap,
              ),
              const Divider(
                color: formColor,
              ),
              if (user.name == me.name)
                _buildMyProfileIcons()
              else
                _buildFriendProfileIcons(),
            ],
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(
                Icons.close,
                size: 30,
                color: basicColorW,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              const RoundIconButton(
                  imagePath: "assets/icons/profile/profile_top_icon_01.png"),
              SizedBox(
                width: smallGap,
              ),
              RoundIconButton(
                  imagePath: "assets/icons/profile/profile_top_icon_02.png"),
              SizedBox(
                width: smallGap,
              ),
              RoundIconButton(
                  imagePath: "assets/icons/profile/profile_top_icon_03.png"),
              SizedBox(
                width: smallGap,
              ),
              RoundIconButton(
                  imagePath: "assets/icons/profile/profile_top_icon_04.png"),
              SizedBox(
                width: mediumGap,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMyProfileIcons() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(
            imagePath: "assets/icons/profile/profile_icon_01.png",
            text: "나와의 채팅",
            routeToNavigate: Move.chatRoomPage,
          ),
          SizedBox(
            width: 50,
          ),
          BottomIconButton(
            imagePath: "assets/icons/profile/profile_icon_02.png",
            text: "프로필 편집",
            routeToNavigate: Move.profileEditPage,
          ),
          SizedBox(
            width: 50,
          ),
          BottomIconButton(
            imagePath: "assets/icons/profile/profile_icon_03.png",
            text: "펑 만들기",
          ),
        ],
      ),
    );
  }

  Widget _buildFriendProfileIcons() {
    return const Padding(
      padding: EdgeInsets.only(top: 20, bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(
            imagePath: "assets/icons/profile/profile_icon_01.png",
            text: "1:1 채팅",
          ),
          SizedBox(
            width: 50,
          ),
          BottomIconButton(
            imagePath: "assets/icons/profile/profile_icon_02.png",
            text: "통화하기",
          ),
          SizedBox(
            width: 50,
          ),
          BottomIconButton(
            imagePath: "assets/icons/profile/profile_icon_03.png",
            text: "페이스톡",
          ),
        ],
      ),
    );
  }
}
