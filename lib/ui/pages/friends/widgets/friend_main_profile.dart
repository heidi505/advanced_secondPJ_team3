import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_detail_response_dto/profile_detail_response_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_update_response_dto/profile_update_response_dto.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/profile_detail_provider.dart';
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

    ProfileDetailModel? model = ref.watch(profileDetailProvider);

    if (model == null) {
      return CircularProgressIndicator();
    }

    ProfileDetailResponseDTO profile = model!.profileDetailResponseDTO!;

    FriendsDTO myProfileDTO = FriendsDTO(
        userId: session.user!.id!,
        nickname: session.user!.nickname,
        phoneNum: session.user!.phoneNum,
        statusMessage: myProfile.statusMessage);

    // FriendsDTO myProfileDTO = FriendsDTO(
    //     userId: session.user!.id!,
    //     nickname: model?.profileUpdateResponseDTO.nickname,
    //     phoneNum:session.user!.phoneNum,
    //     statusMessage: model?.profileUpdateResponseDTO.statusMessage);

    return Container(
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
                  "$baseUrl/images/${profile?.profileImage}",
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
                    "${profile?.nickname}",
                    style: h4(),
                  ),
                  Text(
                    "${profile?.statusMessage}",
                    style: h6(color: basicColorB9),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
