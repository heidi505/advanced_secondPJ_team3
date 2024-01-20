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

class ProfileSubTextFormField extends ConsumerStatefulWidget {
  final statusMessageContoller;
  final Widget textWidget;

  const ProfileSubTextFormField(
      {Key? key,
      required this.textWidget,
      required this.statusMessageContoller})
      : super(key: key);

  @override
  ConsumerState<ProfileSubTextFormField> createState() =>
      _ProfileSubTextFormFieldState();
}

class _ProfileSubTextFormFieldState
    extends ConsumerState<ProfileSubTextFormField> {
  bool _isTextNotEmpty = false;

  void _updateTextStatus() {
    setState(() {
      widget.statusMessageContoller.text != widget.textWidget;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   widget.statusMessageContoller.addListener(_updateTextStatus);
  // }

  // void _updateTextStatus() {
  //   setState(() {
  //     _isTextNotEmpty = widget.statusMessageContoller.text.isNotEmpty ||
  //         widget.statusMessageContoller.text != widget.textWidget;
  //   });
  // }

  // void _messageOnFieldSubmitted(String value) {
  //   Logger().d("----- 메세지 벨류 확인 ----- : + ${value}");
  //   Logger()
  //       .d("----- 메세지 컨트롤러 확인 ----- : " + widget.statusMessageContoller.text);
  //   // ProfileUpdateRequestDTO profileUpdateRequestDto = new ProfileUpdateRequestDTO();
  //   // ref.read(profileUpdateProvider.notifier).updateProfile(profileUpdateRequestDto);
  // }

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
                          controller: widget.statusMessageContoller,
                          autovalidateMode: AutovalidateMode.always,
                          textAlign: TextAlign.center,
                          onChanged: (text) {
                            _updateTextStatus();
                          },
                          decoration: InputDecoration(
                            // hintText: hint,
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
                          // onFieldSubmitted: _messageOnFieldSubmitted,
                          style: TextStyle(color: basicColorW),
                        ),
                      ),
                      if (_isTextNotEmpty)
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.statusMessageContoller!.clear();
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
        widget.statusMessageContoller.text,
        style: TextStyle(color: basicColorW),
      )
          // : widget.textWidget,
          ),
    );
  }
}
