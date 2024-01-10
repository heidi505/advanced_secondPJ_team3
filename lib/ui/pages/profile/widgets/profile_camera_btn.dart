import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_edit_bottom_btn.dart';

class ProfileCameraBtn extends StatefulWidget {
  ProfileCameraBtn({
    super.key,
  });

  @override
  State<ProfileCameraBtn> createState() => _ProfileCameraBtnState();
}

class _ProfileCameraBtnState extends State<ProfileCameraBtn> {
  final picker = ImagePicker();
  XFile? image; // 카메라로 촬영한 이미지를 저장할 변수
  List<XFile?> multiImage = []; // 갤러리에서 여러장의 사진을 선택해서 저장할 변수
  List<XFile?> images = []; // 가져온 사진들을 보여주기 위한 변수
  @override
  Widget build(BuildContext context) {
    return ProfileEditBottomIcon(
      imagePath: "assets/icons/camera.png",
      ontap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              height: 146, // 모달 높이 크기
              margin: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 20,
              ), // 모달 좌우하단 여백 크기
              decoration: const BoxDecoration(
                color: formColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Center(
                        child: Text(
                          "프로필 사진 설정",
                          style: h6(color: basicColorB7),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: basicColorB5.withOpacity(0.4),
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () async {
                        multiImage = await picker.pickMultiImage();
                        setState(() {
                          images.addAll(multiImage);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Center(
                          child: Text(
                            "앨범에서 사진 선택",
                            style: h4(color: pointColor04),
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: basicColorB5.withOpacity(0.4),
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "커스텀 프로필 만들기",
                        style: h4(color: pointColor04),
                      ),
                    ),
                  ),
                ],
              ), // 모달 내부 디자인 영역
            );
          },
          backgroundColor: Colors.transparent,
        );
      },
    );
  }
}
