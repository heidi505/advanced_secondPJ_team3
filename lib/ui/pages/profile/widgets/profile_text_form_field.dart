import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/profile/profile_edit_page.dart';
import 'package:team3_kakao/ui/pages/profile/widgets/profile_text_area.dart';

class ProfileTextFormField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  ProfileTextFormField({
    super.key,
    required this.textWidget,
  });

  final Widget textWidget;

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
                  child: TextFormField(
                    controller: controller,
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
      child: ProfileTextArea(textWidget: textWidget),
    );
  }
}
