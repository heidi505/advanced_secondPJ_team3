import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/open_profile_image.dart';

class FriendAddList extends StatefulWidget {
  const FriendAddList({
    Key? key,
    required this.isChecked,
  }) : super(key: key);

  final bool isChecked;

  @override
  State<FriendAddList> createState() => _FriendAddListState();
}

class _FriendAddListState extends State<FriendAddList> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListTile(
            leading: OpenProfileImage(
              imageHeight: 50,
              imageWidth: 50,
              imagePath: "assets/images/basic_img.jpeg",
              circular: 20,
            ),
            title: Text('으네옹니'),
            trailing: Transform.scale(
              scale: 1.3,
              child: Checkbox(
                value: _isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked = newValue!;
                  });
                },
                activeColor: primaryColor01,
                checkColor: basicColorB,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: formColor),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
        ),
        SizedBox(
          height: xsmallGap,
        ),
      ],
    );
  }
}
