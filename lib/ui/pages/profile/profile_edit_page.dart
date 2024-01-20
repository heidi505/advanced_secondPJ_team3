import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_detail_response_dto/profile_detail_response_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_update_request_dto/profile_update_request_dto.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_update_response_dto/profile_update_response_dto.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/profile_detail_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_camera_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_edit_bottom_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_modal.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_sub_text_form_field.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_text_form_field.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

import '../../../data/dto/friend_dto/main_dto.dart';
import '../../../data/provider/profile_update_provider.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  ProfileEditPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nicknameController = new TextEditingController();
  final TextEditingController _statusMessageContoller =
      new TextEditingController();

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  File? selectedProfileImagePath;
  File? selectedBackImagePath;

  // 콜백 함수 - profile 이미지
  void updateProfileImage(File imagePath) {
    Logger().d("선택된 이미지 경로 : $imagePath");
    setState(() {
      if (imagePath == null) {
        selectedProfileImagePath = null;
      }
      selectedProfileImagePath = imagePath;
      String base64ImageProfile = "";
      final bytes = File(selectedProfileImagePath!.path).readAsBytesSync();
      base64ImageProfile = base64Encode(bytes);
      Logger().d("base64 - profile - 이미지 = $base64ImageProfile");
    });
  }

  // 콜백 함수 - back 이미지
  void updateBackImage(File imagePath) {
    Logger().d("선택된 이미지 경로 : $imagePath");
    if (imagePath == null) {
      selectedBackImagePath = null;
    }
    selectedBackImagePath = imagePath;
    String base64ImageBack = "";
    final bytes = File(selectedBackImagePath!.path).readAsBytesSync();
    base64ImageBack = base64Encode(bytes);
    Logger().d("base64 - back -  이미지 = $base64ImageBack");
  }

  @override
  Widget build(BuildContext context) {
    ProfileDetailModel? profileDetailModel = ref.watch(profileDetailProvider);
    if (profileDetailModel == null) {
      return Center(child: CircularProgressIndicator());
    }
    ProfileDetailResponseDTO profile =
        profileDetailModel.profileDetailResponseDTO!;
    // FriendsDTO myProfile = ref.read(paramProvider).friendDTO!;
    // ProfileUpdateModel? model = ref.watch(profileUpdateProvider);
    // ProfileUpdateResponseDTO? profile = model?.profileUpdateResponseDTO;
    Logger().d("컨트롤러로 값 들어옴? ${widget._statusMessageContoller.text}");
    Logger().d("컨트롤러로 값 들어옴? ${widget._nicknameController.text}");
    widget._nicknameController.text = profile!.nickname;
    widget._statusMessageContoller.text = profile!.statusMessage;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/profile_basic_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(
                  color: Colors.transparent,
                  width: 2,
                ),
              ),
              child: Text(
                "취소",
                style: h4(color: basicColorW),
              ),
            ),
            actions: [
              Consumer(
                builder: (context, ref, child) {
                  return Container(
                    width: 60,
                    height: 40,
                    child: TextButton(
                      onPressed: () async {
                        String base64ImageProfile = "";
                        String base64ImageBack = "";
                        if (selectedProfileImagePath != null) {
                          final bytes = File(selectedProfileImagePath!.path)
                              .readAsBytesSync();
                          base64ImageProfile = base64Encode(bytes);
                        }
                        if (selectedBackImagePath != null) {
                          final bytes = File(selectedBackImagePath!.path)
                              .readAsBytesSync();
                          base64ImageBack = base64Encode(bytes);
                        }
                        ProfileUpdateRequestDTO dto = ProfileUpdateRequestDTO(
                          nickname: widget._nicknameController.text == null
                              ? "${profile.nickname}"
                              : widget._nicknameController.text,
                          statusMessage:
                              widget._statusMessageContoller.text == null
                                  ? "${profile.statusMessage}"
                                  : widget._statusMessageContoller.text,
                          profileImage: base64ImageProfile.isEmpty
                              ? profile.profileImage ?? ""
                              : base64ImageProfile,
                          backImage: base64ImageBack.isEmpty
                              ? profile.backImage ?? ""
                              : base64ImageBack,
                        );

                        Logger().d("전부다 !!!!!" +
                            widget._nicknameController.text +
                            "||||||" +
                            widget._statusMessageContoller.text +
                            "||||||" +
                            base64ImageProfile +
                            "||||||" +
                            base64ImageBack);
                        await ref
                            .read(profileUpdateProvider.notifier)
                            .updateProfile(dto);
                        SessionUser user = ref.read(sessionProvider);
                        ref.read(profileDetailProvider.notifier).notifyInit();
                        user.profileUpdate(dto, user.jwt!);
                        // Navigator.pushNamed(context,
                        //     Move.profilePage); // 이 버튼을 눌렀을때 리퀘스트에 값이 담기고 통신 해야함
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(
                          color: Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "완료",
                        style: h4(color: basicColorW),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: [
              const Spacer(),
              Stack(
                children: [
                  selectedProfileImagePath != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(42),
                          child: Image.file(
                            selectedProfileImagePath!,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        )
                      : ProfileImage(
                          imagePath: "$baseUrl/images/${profile.profileImage}",
                          imageWidth: 100,
                          imageHeight: 100,
                          circular: 42,
                        ),
                  Positioned(
                    bottom: 0, // Adjust this value as needed
                    right: 0, // Adjust this value as needed
                    child: ProfileCameraBtn(
                      updateImageCallback: updateProfileImage,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: xsmallGap,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ProfileTextFormField(
                    nicknameController: widget._nicknameController,
                    textWidget: Text(
                      profile?.nickname ?? "",

// <<<<<<< HEAD
//                       //model!.profileUpdateResponseDTO!.nickname!,
//                   widget.user.name,
//                   style: h4(color: basicColorW),
//                 )),
//
// =======
                      style: h4(color: basicColorW),
                    )),
              ),
              const SizedBox(height: xsmallGap),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ProfileSubTextFormField(
                    statusMessageContoller: widget._statusMessageContoller,
                    textWidget: Text(
                      profile?.nickname ?? "",
                    )),
              ),
              const SizedBox(
                height: mediumGap,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: _buildProfileEditIconBtn(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileEditIconBtn() {
    return Row(
      children: [
        ProfileEditBottomIcon(
          imagePath: "assets/icons/camera.png",
          ontap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ProfileModal(
                  updateImageCallback: updateBackImage,
                );
              },
              backgroundColor: Colors.transparent,
            );
          },
        ),
        SizedBox(width: smallGap),
        ProfileEditBottomIcon(
          imagePath: "assets/icons/profile/profile_edit_icon_01.png",
        ),
        SizedBox(width: smallGap),
        ProfileEditBottomIcon(
          imagePath: "assets/icons/profile/profile_edit_icon_02.png",
        ),
        SizedBox(width: smallGap),
        ProfileEditBottomIcon(
          imagePath: "assets/icons/profile/profile_edit_icon_03.png",
        ),
        SizedBox(width: smallGap),
        ProfileEditBottomIcon(
          imagePath: "assets/icons/profile/profile_edit_icon_04.png",
        ),
        SizedBox(width: smallGap),
        ProfileEditBottomIcon(
          imagePath: "assets/icons/profile/profile_edit_icon_05.png",
        ),
        SizedBox(width: smallGap),
        ProfileEditBottomIcon(
          imagePath: "assets/icons/profile/profile_edit_icon_06.png",
        ),
        SizedBox(width: smallGap),
        ProfileEditBottomIcon(
          imagePath: "assets/icons/profile/profile_edit_icon_07.png",
        ),
        SizedBox(width: smallGap),
        ProfileEditBottomIcon(
          imagePath: "assets/icons/profile/profile_edit_icon_08.png",
        ),
        SizedBox(width: smallGap),
        ProfileEditBottomIcon(
          imagePath: "assets/icons/profile/profile_edit_icon_09.png",
        ),
        SizedBox(width: smallGap),
      ],
    );
  }
}
