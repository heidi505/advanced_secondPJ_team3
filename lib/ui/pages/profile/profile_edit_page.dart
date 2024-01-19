import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_update_request_dto/profile_update_request_dto.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/data/model/user_mock.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/data/repository/user_repository.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_camera_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_edit_bottom_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_icon_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_modal.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_sub_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_text_form_field.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/round_icon_btn.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

import '../../../data/dto/friend_dto/main_dto.dart';
import '../../../data/dto/response_dto.dart';
import '../../../data/provider/profile_update_provider.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  ProfileEditPage({Key? key}) : super(key: key);

  TextEditingController _nicknameController = new TextEditingController();
  TextEditingController _statusMessageContoller = new TextEditingController();

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  final picker = ImagePicker();
  XFile? image; // 카메라로 촬영한 이미지를 저장할 변수
  List<XFile?> multiImage = []; // 갤러리에서 여러장의 사진을 선택해서 저장할 변수
  List<XFile?> images = []; // 가져온 사진들을 보여주기 위한 변수

  @override
  Widget build(BuildContext context) {
    User session = ref.read(sessionProvider).user!;
    FriendsDTO myProfile = ref.read(paramProvider).friendDTO!;
    print("컨트롤러로 값 들어옴? ${widget._statusMessageContoller.text}");
    print("컨트롤러로 값 들어옴? ${widget._nicknameController.text}");

    ProfileUpdateModel? model = ref.watch(profileUpdateProvider);

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
                  SessionUser seeeionUser = ref.read(sessionProvider);
                  return Container(
                    width: 60,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        // 입력값 dto에 저장
                        ProfileUpdateRequestDTO dto = ProfileUpdateRequestDTO(
                            nickname: widget._nicknameController.text,
                            statusMessage: widget._statusMessageContoller.text);
                        Logger().d("DTO 값 잘 받니?  ${dto.statusMessage}");
                        Logger().d("DTO 값 잘 받니?  ${dto.nickname}");
                        ref
                            .read(profileUpdateProvider.notifier)
                            .updateProfile(dto);
                        Navigator.pushNamed(context,
                            Move.profilePage); // 이 버튼을 눌렀을때 리퀘스트에 값이 담기고 통신 해야함
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
                  ProfileImage(
                    imagePath: "$baseUrl/images/${session.id}.jpg",
                    imageWidth: 100,
                    imageHeight: 100,
                    circular: 42,
                  ),
                  Positioned(
                    bottom: 0, // Adjust this value as needed
                    right: 0, // Adjust this value as needed
                    child: ProfileCameraBtn(),
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
// <<<<<<< HEAD
//                       //model!.profileUpdateResponseDTO!.nickname!,
//                   widget.user.name,
//                   style: h4(color: basicColorW),
//                 )),
//
// =======
                      session.nickname!,
                      style: h4(color: basicColorW),
                    )),

              ),
              const SizedBox(height: xsmallGap),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ProfileSubTextFormField(
                    statusMessageContoller: widget._statusMessageContoller,
                    textWidget: Text(
// <<<<<<< HEAD
//                       //model!.profileUpdateResponseDTO!.statusMessage!,
//                   widget.user.intro,
//                   style: h5(color: basicColorW),
//                 )),
// =======
                      myProfile.statusMessage!,
                      style: h5(color: basicColorW),
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
                return ProfileModal();
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
