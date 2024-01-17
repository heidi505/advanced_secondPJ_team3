import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_icon_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/round_icon_btn.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

import '../../../data/model/profile_detail_model.dart';
import '../../../data/provider/profile_detail_provider.dart';

class ProfilePage extends ConsumerWidget {
  ProfilePage({Key? key}) : super(key: key);

  final logger = Logger();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ParamStore paramStore = ref.read(paramProvider);
    SessionUser session = ref.read(sessionProvider);
    FriendsDTO model = paramStore.friendDTO!;

    logger.d('즐찾: ${model!.isFavorite}');

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
                  imagePath: "$baseUrl/images/${model!.userId}.jpg",
                  imageWidth: 100,
                  imageHeight: 100,
                  circular: 42),
              const SizedBox(
                height: xsmallGap,
              ),
              Text(model!.nickname!, style: h4(color: basicColorW)),
              const SizedBox(height: xsmallGap),
              Text(
                model!.statusMessage!,
                style: h5(color: basicColorW),
              ),
              const SizedBox(
                height: mediumGap,
              ),
              const Divider(
                color: formColor,
              ),
              if (session.user!.id! != model!.userId!)
                _buildFriendProfileIcons()
              else
                _buildMyProfileIcons(),
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
              // if (session.user!.id! != model!.userId!)
              // _buildFriendProfileTopIcons()
              // else
              if (session.user!.id! != model!.userId!)
                _buildFriendProfileTopIcons(model)
              else
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

  // 친구 즐찾 상태에 따라 뜨는 아이콘
  Widget _buildFriendProfileTopIcons(FriendsDTO model) {
    return Row(
      children: [
        if (model.isFavorite!)
          RoundIconButton(imagePath: "assets/icons/profile/profile_top_icon_07.png")
        else
          RoundIconButton(imagePath: "assets/icons/profile/profile_top_icon_06.png"),
        SizedBox(width: smallGap),
        RoundIconButton(imagePath: "assets/icons/profile/profile_top_icon_04.png"),
      ],
    );
  }
}