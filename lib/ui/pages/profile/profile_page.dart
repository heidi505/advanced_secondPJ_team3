import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/friend_dto/favorite_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_detail_response_dto/profile_detail_response_dto.dart';
import 'package:team3_kakao/data/provider/favorite_friend_provider.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/profile_detail_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_favorites.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_icon_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/round_icon_btn.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

import '../../../data/provider/profile_update_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  bool isFavorite = false;
  final logger = Logger();

  void changeFavorite(FriendsDTO model, WidgetRef ref) {
    setState(() {
      isFavorite = !isFavorite; // 토글 형태로 변경
    });

    // 여기에 즐겨찾기 업데이트 등의 로직 추가
    ref.read(favoriteUpdateProvider.notifier).updateFavoriteStatus(model);
  }

  @override
  Widget build(BuildContext context) {
    ParamStore paramStore = ref.read(paramProvider);
    SessionUser session = ref.read(sessionProvider);
    //FriendsDTO model = paramStore.friendDTO!;
    ProfileDetailModel? profileDetailModel = ref.watch(profileDetailProvider);

    if (profileDetailModel == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    ProfileDetailResponseDTO profile =
        profileDetailModel!.profileDetailResponseDTO!;

    FriendsDTO model = FriendsDTO(
        userId: paramStore.friendDTO!.userId,
        backImage: paramStore.friendDTO!.backImage,
        birthdate: paramStore.friendDTO!.backImage,
        isBirthday: paramStore.friendDTO!.isBirthday,
        nickname: paramStore.friendDTO!.nickname,
        phoneNum: paramStore.friendDTO!.phoneNum,
        profileImage: paramStore.friendDTO!.profileImage,
        statusMessage: paramStore.friendDTO!.statusMessage,
        isFavorite: paramStore.friendDTO!.isFavorite);

    ProfileUpdateModel? profileModel = ref.watch(profileUpdateProvider);

    FriendsDTO friendsDto = FriendsDTO(
        userId: model.userId,
        nickname: model.nickname,
        statusMessage: model.statusMessage);

    // logger.d('즐찾: ${model!.isFavorite}');

    //  logger.d('값 나옴? : ${profileModel?.profileUpdateResponseDTO?.nickname}');

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
                imagePath: session.user!.id != model!.userId
                    ? "$baseUrl/images/${paramStore.friendDTO!.profileImage}"
                    : "$baseUrl/images/${profile.profileImage}",
                imageWidth: 100,
                imageHeight: 100,
                circular: 42,
              ),
              const SizedBox(
                height: xsmallGap,
              ),
              Text(
                session.user!.id != model!.userId
                    ? paramStore.friendDTO!.nickname ?? 'DefaultNickname'
                    : profile.nickname ?? 'DefaultNickname',
                style: h4(color: basicColorW),
              ),
              const SizedBox(height: xsmallGap),
              Text(
                session.user!.id != model!.userId
                    ? paramStore.friendDTO!.statusMessage ??
                        'DefaultStatusMessage'
                    : profile.statusMessage ?? 'DefaultStatusMessage',
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
                imagePath: "assets/icons/profile/profile_top_icon_01.png",
              ),
              SizedBox(
                width: smallGap,
              ),
              RoundIconButton(
                imagePath: "assets/icons/profile/profile_top_icon_02.png",
              ),
              SizedBox(
                width: smallGap,
              ),
              RoundIconButton(
                imagePath: "assets/icons/profile/profile_top_icon_03.png",
              ),
              SizedBox(
                width: smallGap,
              ),
              if (session.user!.id! != model!.userId!)
                _buildFriendProfileTopIcons(model, ref)
              else
                RoundIconButton(
                  imagePath: "assets/icons/profile/profile_top_icon_04.png",
                ),
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

  Widget _buildFriendProfileTopIcons(FriendsDTO model, WidgetRef ref) {
    // String imagePath = model.isFavorite!
    //     ? "assets/icons/profile/profile_top_icon_07.png"
    //     : "assets/icons/profile/profile_top_icon_06.png";
    // isFavorite = model.isFavorite!;
    return Row(
      children: [
        // 즐찾 되어 있는 상태일 때
        // if (model.isFavorite!)
        RoundIconButton2(
          imagePath: isFavorite
              ? "assets/icons/profile/profile_top_icon_07.png"
              : "assets/icons/profile/profile_top_icon_06.png",
          onPressed: () {
            changeFavorite(model, ref);
            logger.d("버튼클릭!! 즐찾 상태111111!!");
            logger.d(model.isFavorite);
            // _updateFavoriteStatus(model, ref);
            logger.d("버튼클릭!! 즐찾 상태!!");
            logger.d(model.isFavorite);
          },
        ),
        SizedBox(width: smallGap),
        RoundIconButton2(
          imagePath: "assets/icons/profile/profile_top_icon_04.png",
          onPressed: () {},
        ),
      ],
    );
  }

  void _updateFavoriteStatus(FriendsDTO model, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionProvider);
    ParamStore paramStore = ref.read(paramProvider);

    ref.read(favoriteUpdateProvider.notifier).updateFavoriteStatus(model);
  }
}
// 친구 즐찾 상태에 따라 뜨는 아이콘
//   Widget _buildFriendProfileTopIcons(FriendsDTO model) {
//     return Row(
//       children: [
//         if (model.isFavorite!)
//           RoundIconButton(imagePath: "assets/icons/profile/profile_top_icon_07.png")
//         else
//           RoundIconButton(imagePath: "assets/icons/profile/profile_top_icon_06.png"),
//         SizedBox(width: smallGap),
//         RoundIconButton(imagePath: "assets/icons/profile/profile_top_icon_04.png"),
//       ],
//     );
//   }
// }
//   Widget _buildFriendProfileTopIcons(FriendsDTO model, WidgetRef ref) {
//     return Row(
//       children: [
//         // 즐찾 되어 있는 상태일 때
//         if (model.isFavorite!)
//           RoundIconButton2(
//             imagePath: "assets/icons/profile/profile_top_icon_07.png",
//             onPressed: () {
//               logger.d("버튼클릭!! 즐찾 상태111111!!");
//               logger.d(model.isFavorite);
//               _abcd(model, ref);
//               logger.d("버튼클릭!! 즐찾 상태!!");
//               logger.d(model.isFavorite);
//             },
//           )
//         else
//           // 즐찾 안된 상태일때
//           RoundIconButton2(
//             imagePath: "assets/icons/profile/profile_top_icon_06.png",
//             onPressed: () {
//               logger.d("버튼클릭!! 즐찾 상태111111!!");
//               logger.d(model.isFavorite);
//               _abcd(model, ref);
//               logger.d("버튼클릭!! 즐찾 상태2222");
//               logger.d(model.isFavorite);
//               // ref.read(profileUpdateProvider.notifier).updateProfileIcon("assets/icons/profile/profile_top_icon_06.png");
//               // ref.read(favoriteUpdateProvider.notifier).updateProfileIcon("assets/icons/profile/profile_top_icon_06.png");
//             },
//           ),
//         SizedBox(width: smallGap),
//         RoundIconButton2(
//           imagePath: "assets/icons/profile/profile_top_icon_04.png",
//           onPressed: () {},
//         ),
//       ],
//     );

// void _abcd(FriendsDTO model, WidgetRef ref) {
//   // SessionUser sessionUser = ref.read(sessionProvider);
//   // ParamStore paramStore = ref.read(paramProvider);
//   // FavoriteFriendDTO favoriteFriendDTO =
//   //     FavoriteFriendDTO.fromFriendsDTO(model);
//   // FriendsDTO friendsDTO = FriendsDTO();
//   // logger.d('에비씨디 메숴드');
//   // logger.d(favoriteFriendDTO.isFavorite);
//   // ref.read(favoriteUpdateProvider.notifier).updateFavoriteStatus(
//   //     favoriteFriendDTO, friendsDTO, sessionUser.user!.jwt!);
//   // // ref.read(favoriteUpdateProvider.notifier).notifyInit(favoriteFriendDTO);
//   bool newFavoriteStatus = !model.isFavorite!;
//   ref.read(favoriteUpdateProvider.notifier).updateFavoriteStatus(model, newFavoriteStatus, jwt);
//   ref.read(favoriteUpdateProvider.notifier).updateProfileIcon(
//     newFavoriteStatus
//     ?
//   )
// }
