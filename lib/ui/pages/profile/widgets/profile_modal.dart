import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';

class ProfileModal extends StatefulWidget {
  final void Function(File)? updateImageCallback;

  const ProfileModal({Key? key, this.updateImageCallback}) : super(key: key);

  @override
  State<ProfileModal> createState() => _ProfileModalState();
}

class _ProfileModalState extends State<ProfileModal> {
  File? _image; //이미지를 담을 변수 선언

  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); //가져온 이미지를 _image에 저장
        Logger().d('$_image + 가져온 이미지샴');
        widget.updateImageCallback!(_image!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                getImage(ImageSource.gallery);
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
  }
}
