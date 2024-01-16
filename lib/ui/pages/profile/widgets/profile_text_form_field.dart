import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/profile/profile_edit_page.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_text_area.dart';

import '../../../../data/dto/profile_dto/profile_update_request_dto/profile_update_request_dto.dart';
import '../../../../data/provider/profile_update_provider.dart';

class ProfileTextFormField extends ConsumerStatefulWidget {
  const ProfileTextFormField({Key? key, required this.textWidget})
      : super(key: key);

  final Widget textWidget;

  @override
  ConsumerState<ProfileTextFormField> createState() => _ProfileTextFormFieldState();
}

class _ProfileTextFormFieldState extends ConsumerState<ProfileTextFormField> {
  final TextEditingController _nicknameController = new TextEditingController();
  bool _isTextNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _nicknameController.addListener(_updateTextStatus);
  }

  void _updateTextStatus() {
    setState(() {
      _isTextNotEmpty =
          _nicknameController.text.isNotEmpty || _nicknameController.text != widget.textWidget;
    });
  }

  void _onFieldSubmitted(String value) {
    Logger().d("----- 입력값 벨류 확인 ----- : + ${value}");
    Logger().d("----- 입력값 컨트롤러 확인 ----- : " + _nicknameController.text);
    ProfileUpdateRequestDTO profileUpdateRequestDto = new ProfileUpdateRequestDTO(nickname: value);
    ref.read(profileUpdateProvider.notifier).updateProfile(profileUpdateRequestDto);
  }

  @override
  Widget build(BuildContext context) {
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
                          controller: _nicknameController,
                          autovalidateMode: AutovalidateMode.always,
                          textAlign: TextAlign.center,
                          onChanged: (text) {
                            _updateTextStatus();
                          },
                          decoration: InputDecoration(
                            hintText: '홍길동',
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
                          onFieldSubmitted: _onFieldSubmitted,
                          style: TextStyle(color: basicColorW),
                        ),
                      ),
                      if (_isTextNotEmpty)
                        InkWell(
                          onTap: () {
                            setState(() {
                              _nicknameController.clear();
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
        textWidget: _isTextNotEmpty
            ? Text(
          _nicknameController.text,
                style: TextStyle(color: basicColorW),
              )
            : widget.textWidget,
      ),
    );
  }
}
