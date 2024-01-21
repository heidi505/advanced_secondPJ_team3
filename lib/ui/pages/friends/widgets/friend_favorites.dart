import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_sub_title.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';

import '../../../../_core/constants/http.dart';

class FriendFavorites extends StatelessWidget {
  const FriendFavorites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
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
                title: "즐겨찾기",
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    Container(
                      height: ,
                      child: ListView.builder(
                          itemBuilder:
                          itemCount: ,)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
