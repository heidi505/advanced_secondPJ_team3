import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_edit_bottom_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_modal.dart';

class ProfileCameraBtn extends StatefulWidget {
  ProfileCameraBtn({
    super.key,
  });

  @override
  State<ProfileCameraBtn> createState() => _ProfileCameraBtnState();
}

class _ProfileCameraBtnState extends State<ProfileCameraBtn> {
  @override
  Widget build(BuildContext context) {
    return ProfileEditBottomIcon(
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
    );
  }
}
