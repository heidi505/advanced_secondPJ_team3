import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/profile_dto/profile_update_response_dto/profile_update_response_dto.dart';
import 'package:team3_kakao/ui/pages/profile/profile_edit_page.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_text_area.dart';

import '../../../../data/dto/profile_dto/profile_update_request_dto/profile_update_request_dto.dart';
import '../../../../data/provider/profile_update_provider.dart';

class ProfileTextFormField extends ConsumerStatefulWidget {
  final nicknameController;
  final Widget textWidget;

  const ProfileTextFormField(
      {Key? key, required this.textWidget, required this.nicknameController})
      : super(key: key);

  @override
  ConsumerState<ProfileTextFormField> createState() =>
      _ProfileTextFormFieldState();
}

class _ProfileTextFormFieldState extends ConsumerState<ProfileTextFormField> {
  // 닉네임 입력값
  bool _isTextNotEmpty = false;

  // @override
  // void initState() {
  //   super.initState();
  //   widget.nicknameController.addListener(_updateTextStatus);
  // }

  void _updateTextStatus() {
    setState(() {
      widget.nicknameController.text != widget.textWidget;
    });
  }

  // void _nicknameOnFieldSubmitted(String value) {
  //   Logger().d("----- 닉네임 벨류 확인 ----- : + ${value}");
  //   Logger().d("----- 닉네임 컨트롤러 확인 ----- : " + widget.nicknameController.text);
  //   // ProfileUpdateRequestDTO profileUpdateRequestDto = new ProfileUpdateRequestDTO();
  //   // ref.read(profileUpdateProvider.notifier).updateProfile(profileUpdateRequestDto);
  // }

  @override
  Widget build(BuildContext context) {
    // ProfileUpdateResponseDTO? profile =
    //     ref.watch(profileUpdateProvider)?.profileUpdateResponseDTO;
    // if (profile == null) {
    //   return Center(child: CircularProgressIndicator());
    // }
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: basicColorW.withOpacity(0.3),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: widget.nicknameController,
                          autovalidateMode: AutovalidateMode.always,
                          textAlign: TextAlign.center,
                          onChanged: (text) {
                            _updateTextStatus();
                          },
                          decoration: InputDecoration(
                            // hintText: '${profile.nickname}',
                            hintStyle: TextStyle(color: basicColorW),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: basicColorW),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // onFieldSubmitted: _nicknameOnFieldSubmitted,
                          style: TextStyle(color: basicColorW),
                        ),
                      ),
                      if (_isTextNotEmpty)
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.nicknameController.clear();
                              _isTextNotEmpty = false;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image.asset(
                              'assets/icons/search_close.png',
                              fit: BoxFit.cover,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: ProfileTextArea(
          textWidget: Text(
        widget.nicknameController.text,
        style: TextStyle(color: basicColorW),
      )),
    );
  }
}
