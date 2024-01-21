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

import '../../../../data/model/profile.dart';
import '../../../../data/model/user.dart';
import '../../../../data/provider/profile_update_provider.dart';

final logger = Logger();

class FriendMainProfile extends ConsumerWidget {
  final Profile myProfile;
  const FriendMainProfile({super.key, required this.myProfile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser session = ref.read(sessionProvider);
    ParamStore paramStore = ref.read(paramProvider);

    ProfileUpdateModel? model = ref.watch(profileUpdateProvider);

    FriendsDTO myProfileDTO = FriendsDTO(
        userId: session.user!.id!,
        nickname: session.user!.nickname,
        phoneNum: session.user!.phoneNum,
        statusMessage: session.user!.statusMessage);

    // FriendsDTO myProfileDTO = FriendsDTO(
    //     userId: session.user!.id!,
    //     nickname: model?.profileUpdateResponseDTO.nickname,
    //     phoneNum:session.user!.phoneNum,
    //     statusMessage: model?.profileUpdateResponseDTO.statusMessage);

    return SliverToBoxAdapter(
        child: InkWell(
      onTap: () {
        paramStore.addProfileDetail(myProfileDTO);
        Navigator.pushNamed(context, Move.profilePage);
      },
      child: Container(
        padding:
            EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 8.0),
        child: Row(
          children: [
            ClipRRect(
              child: Image.network(
                "$baseUrl/images/${session.user!.id}.jpg",
                fit: BoxFit.cover,
                width: 60,
                height: 60,
              ),
              borderRadius: BorderRadius.circular(24.0),
            ),
            SizedBox(
              width: mediumGap,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${session.user!.nickname}",
                  style: h4(),
                ),
                Text(
                  "${session.user!.statusMessage}",
                  style: h6(color: basicColorB9),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
