import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/data/model/user_mock.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_camera_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_edit_bottom_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_icon_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/round_icon_btn.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

class ProfileEditPage extends StatefulWidget {
  ProfileEditPage({Key? key, required this.user}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final UserMock user;

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final picker = ImagePicker();
  XFile? image; // 카메라로 촬영한 이미지를 저장할 변수
  List<XFile?> multiImage = []; // 갤러리에서 여러장의 사진을 선택해서 저장할 변수
  List<XFile?> images = []; // 가져온 사진들을 보여주기 위한 변수

  @override
  Widget build(BuildContext context) {

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
              Container(
                width: 60,
                height: 40,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Move.profilePage);
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
              ),
            ],
          ),
          body: Column(
            children: [
              const Spacer(),
              Stack(
                children: [
                  ProfileImage(
                    imagePath: images.isNotEmpty
                        ? images.first!.path
                        : "assets/images/basic_img.jpeg",
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
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: basicColorW.withOpacity(0.3),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                controller: widget.controller,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: '홍길동',

                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: basicColorW),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: basicColorW.withOpacity(0.4),
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.user.name,
                                style: h4(color: basicColorW)),
                            SizedBox(
                              width: xsmallGap,
                            ),
                            Image.asset(
                              "assets/icons/profile/profile_icon_02.png",
                              fit: BoxFit.cover,
                              width: 20,
                              height: 20,
                              color: basicColorW,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: xsmallGap),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: basicColorW.withOpacity(0.4),
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.user.intro, style: h5(color: basicColorW)),
                      SizedBox(
                        width: xsmallGap,
                      ),
                      Image.asset(
                        "assets/icons/profile/profile_icon_02.png",
                        fit: BoxFit.cover,
                        width: 20,
                        height: 20,
                        color: basicColorW,
                      )
                    ],
                  ),
                ),
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
            ProfileCameraBtn();
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
