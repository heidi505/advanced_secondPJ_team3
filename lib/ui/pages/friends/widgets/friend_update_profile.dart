import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_sub_title.dart';

class FriendUpdateProfile extends StatelessWidget {
  const FriendUpdateProfile({
    super.key,
  });

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
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  "assets/images/basic_img.jpeg",
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
                                "김하얀",
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
