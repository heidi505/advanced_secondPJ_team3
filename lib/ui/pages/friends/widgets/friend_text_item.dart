import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/ui/pages/friends/friends_birthday_page.dart';
import 'package:team3_kakao/ui/pages/main_view_model.dart';

import '../../../../_core/constants/size.dart';

class FriendTextItem extends ConsumerWidget {
  String imagePath;
  String text;

  FriendTextItem({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MainPageModel? model = ref.watch(mainProvider);

    if (model == null) {
      return CircularProgressIndicator();
    }

    MainDTO? mainDTO = model!.mainDTO;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FriendsBirthDayPage(
                    friendList: mainDTO!.birthdayFriendList!)));
      },
      child: Container(
        child: Row(
          children: [
            SvgPicture.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: smallGap,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
