import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/_core/constants/theme.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_sub_title.dart';

import '../../widgets/chatting_items/chatting_item.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("친구"),
              SizedBox(width: 16),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              "assets/icons/search_icon.svg",
              fit: BoxFit.cover,
              width: 25,
              height: 25,
            ),
          ),
          SizedBox(
            width: xsmallGap,
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              "assets/icons/friend_add_icon.svg",
              fit: BoxFit.cover,
              width: 25,
              height: 25,
            ),
          ),
          SizedBox(
            width: mediumGap,
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, bottom: 8.0, top: 8.0),
              child: Row(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      "assets/images/basic_img.jpeg",
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  SizedBox(
                    width: mediumGap,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "김하얀",
                        style: h4(),
                      ),
                      Text(
                        "상태메시지",
                        style: h6(color: basicColorB9),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
          SliverToBoxAdapter(
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
          ),
          SliverToBoxAdapter(
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
                      title: "펑",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 16.0, right: 16.0),
                      child: Container(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/pop_icon.svg",
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: smallGap,
                            ),
                            Text("나의 펑을 만들어보세요!"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
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
                      title: "생일인 친구",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 16.0, right: 16.0),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                ChattingItem(
                                  circular: 16.0,
                                  imageWidth: 40,
                                  imageHeight: 40,
                                  imagePath: "assets/images/basic_img.jpeg",
                                  title: "김하얀",
                                  subTitle: "어제 1월 2일",
                                ),
                                ChattingItem(
                                  circular: 16.0,
                                  imageWidth: 40,
                                  imageHeight: 40,
                                  imagePath: "assets/images/basic_img.jpeg",
                                  title: "김하얀",
                                  subTitle: "어제 1월 2일",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: smallGap,
                          ),
                          Container(
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/cake_icon.svg",
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: smallGap,
                                ),
                                Text("친구의 생일을 확인해보세요!"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
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
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 16.0, right: 16.0),
                      child: Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                ChattingItem(
                                  circular: 16.0,
                                  imageWidth: 40,
                                  imageHeight: 40,
                                  imagePath: "assets/images/basic_img.jpeg",
                                  title: "김하얀",
                                  subTitle: "어제 1월 2일",
                                ),
                                ChattingItem(
                                  circular: 16.0,
                                  imageWidth: 40,
                                  imageHeight: 40,
                                  imagePath: "assets/images/basic_img.jpeg",
                                  title: "김하얀",
                                  subTitle: "어제 1월 2일",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FriendSubTitle(
              title: "친구 11",
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ChattingItem(
                  circular: 16.0,
                  imageWidth: 40,
                  imageHeight: 40,
                  imagePath: "assets/images/basic_img.jpeg",
                  title: "김하얀",
                  subTitle: "3조 프로젝트 화이팅",
                ),
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
