import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/size.dart';

class NotifyTabBar extends StatefulWidget {
  @override
  _NotifyTabBarState createState() => _NotifyTabBarState();
}

class _NotifyTabBarState extends State<NotifyTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // TabController를 초기화하고 탭의 수를 설정
    _tabController =
        TabController(length: 7, vsync: this); // 탭의 수에 따라 length를 조정합니다.
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //실제 탭 표시
        TabBar(
          controller: _tabController, //TabController 연결
          tabs: [
            //탭 레이블 설정
            Tab(text: '전체'),
            Tab(text: '공지'),
            Tab(text: '사진'),
            Tab(text: '동영상'),
            Tab(text: '파일 '),
            Tab(text: '투표'),
            SizedBox(width: smallGap,), //SizedBox도 탭 갯수로 쳐야하네..
          ],
          labelPadding: EdgeInsets.symmetric(horizontal: 8.0),//탭 간격 조정
          indicatorColor: Colors.black,
          labelColor: Colors.black,// 선택된 탭 텍스트 색
          unselectedLabelColor: Colors.grey, //선택되지 않은 탭 텍스트 색
        ),
        SizedBox(
          height: 200, // TabBarView 높이 조정
          child: TabBarView(
            controller: _tabController, //TabController 연결
            children: [
              // 첫 번째 탭의 내용
              Center(
                child: Text('Content of Tab 1'),
              ),
              // 두 번째 탭의 내용
              Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: 10, // 예시로 10개의 아이템을 표시
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(); // 각 아이템 사이에 구분선을 추가
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('Item $index'),
                          subtitle: Text('TimeStamp'),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Center(
                child: Text('Content of Tab 2'),
              ),
              Center(
                child: Text('Content of Tab 2'),
              ),
              Center(
                child: Text('Content of Tab 2'),
              ),
              Center(
                child: Text('Content of Tab 2'),
              ),
              Center(
                child: Text('Content of Tab 2'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    //페이지 소멸될 때 TabController 정리
    _tabController.dispose();
    super.dispose();
  }
}
