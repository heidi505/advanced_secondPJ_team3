import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/model/user.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_sub_title.dart';

import '../../../../data/model/user_mock.dart';

class FriendUpdateProfile extends StatelessWidget {
  const FriendUpdateProfile({
    super.key,
  });

  get baseUrl => null;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: bgAndLineColor,
              width: 1.0,
            ),
            bottom: BorderSide(
              color: bgAndLineColor,
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FriendSubTitle(
                title: "업데이트 프로필 11",
              ),
              SizedBox(
                height: 68,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: friends.length,
                  itemBuilder: (BuildContext context, int index) {
                    UserMock friend = friends[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Move.profilePage);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.network(
                                  baseUrl + "/images/basic.jpeg",
                                  fit: BoxFit.cover,
                                  width: 40,
                                  height: 40,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              SizedBox(
                                height: xsmallGap,
                              ),
                              Text(
                                friend.name,
                                style: subText(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
