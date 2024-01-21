import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

class FriendsBirthDayPage extends StatelessWidget {
  final List<FriendsDTO> friendList;

  FriendsBirthDayPage({super.key, required this.friendList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text("생일인 친구")),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => InkWell(
                  onTap: () {
                    // 탭한 친구 프로필로 이동
                  },
                  child: Container(
                    margin: EdgeInsets.zero,
                    color: Colors.transparent,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      leading: ClipRRect(
                        child: Image.network(
                          baseUrl + "/images/${friendList[index].profileImage}",
                          fit: BoxFit.cover,
                          width: 40,
                          height: 40,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      title: Container(
                        child: Row(
                          children: [
                            Text("${friendList[index].nickname}",
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      subtitle: Text("${friendList[index].birthdate}"),
                      // isThreeLine: ${friendList[0].birthdate} != null,
                    ),
                  ),
                ),
                childCount: friendList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
