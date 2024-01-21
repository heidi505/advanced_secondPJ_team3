import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/friend_dto/friend_search_response_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/provider/add_friend_to_chat_provider.dart';
import 'package:team3_kakao/ui/pages/friends/friends_add_view_model.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/open_profile_image.dart';

class FriendAddList extends ConsumerStatefulWidget {
  FriendAddList({Key? key, required this.isChecked, this.friend})
      : super(key: key);

  final bool isChecked;
  FriendsDTO? friend;

  @override
  _FriendAddListState createState() => _FriendAddListState();
}

class _FriendAddListState extends ConsumerState<FriendAddList> {
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
            leading: OpenProfileImage2(
              imageHeight: 50,
              imageWidth: 50,
              imagePath: "$baseUrl/images/${widget.friend!.userId}.jpg",
              circular: 20,
            ),
            title: Text(widget.friend!.nickname!),
            trailing: Transform.scale(
              scale: 1.3,
              child: Checkbox(
                value: _isChecked,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked = newValue!;
                  });
                  if (_isChecked == true) {
                    ref
                        .read(addFriendToChatProvider.notifier)
                        .friendsToAdd(widget.friend!);
                  }
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
