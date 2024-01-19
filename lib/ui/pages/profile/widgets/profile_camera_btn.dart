import 'dart:io';

import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_edit_bottom_btn.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_modal.dart';

class ProfileCameraBtn extends StatefulWidget {
  final void Function(File)? updateImageCallback;
  ProfileCameraBtn({
    this.updateImageCallback,
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
            return ProfileModal(
              updateImageCallback: widget.updateImageCallback,
            );
          },
          backgroundColor: Colors.transparent,
        );
      },
    );
  }
}
