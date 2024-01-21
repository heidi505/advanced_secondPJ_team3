import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_update_request_dto/profile_update_request_dto.dart';
import 'package:team3_kakao/data/model/user_mock.dart';
import 'package:team3_kakao/data/provider/profile_update_provider.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_icon_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_detail_model.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/round_icon_btn.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

import '../../../data/model/profile_detail_model.dart';
import '../../../data/provider/profile_detail_provider.dart';

class ProfileFriendPage extends ConsumerWidget {
  ProfileFriendPage({Key? key, required this.friendsDTO}) : super(key: key);

  FriendsDTO friendsDTO;
  // final UserMock user;
  final logger = Logger();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProfileDetailModel? model = ref.watch(profileDetailProvider);
    ProfileUpdateModel? updateModel = ref.watch(profileUpdateProvider);

    logger.d('즐찾: ${friendsDTO.isFavorite}');

    if (model == null) {
      return CircularProgressIndicator();
    }
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
              // --------------- 테스트 ----------------
              // Text(model.profileDetailResponseDTO.profileImage),
              // Text(model.profileDetailResponseDTO.backImage),
              // --------------- 테스트 ----------------
              // Text(model.profileDetailResponseDTO.nickname,
              //     style: h4(color: basicColorW)),
              Text("${friendsDTO.nickname}", style: h4(color: basicColorW)),
              const SizedBox(height: xsmallGap),
              Text(
                "${friendsDTO.statusMessage}",
                style: h5(color: basicColorW),
              ),
              const SizedBox(
                height: mediumGap,
              ),
              const Divider(
                color: formColor,
              ),
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
                  imagePath: "assets/icons/profile/profile_top_icon_05.png"),
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
