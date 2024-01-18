import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/chat_notify/chat_notify_view_model.dart';

class NotifyTabBar extends StatefulWidget {
  @override
  State<NotifyTabBar> createState() => _NotifyTabBarState();

  const NotifyTabBar({super.key});
}

class _NotifyTabBarState extends State<NotifyTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TabController를 초기화하고 탭의 수를 설정
    _tabController =
        TabController(length: 7, vsync: this); // 탭의 수에 따라 length를 조정합니다.
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        ChatNotifyModel? notifyModel = ref.watch(chatNotifyProvider);
        if (notifyModel == null) {
          return Center(child: CircularProgressIndicator());
        }

        return Expanded(
          child: Column(
            children: [
              //실제 탭 표시
              TabBar(
                controller: _tabController,
                //TabController 연결
                tabs: [
                  //탭 레이블 설정
                  Tab(text: '전체'),
                  Tab(text: '공지'),
                  Tab(text: '사진'),
                  Tab(text: '동영상'),
                  Tab(text: '파일 '),
                  Tab(text: '투표'),
                  SizedBox(
                    width: smallGap,
                  ), //SizedBox도 탭 갯수로 쳐야하네..
                ],
                labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                //탭 간격 조정
                indicatorColor: basicColorB1,
                labelColor: basicColorB1,
                // 선택된 탭 텍스트 색
                unselectedLabelColor: basicColorB9, //선택되지 않은 탭 텍스트 색
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController, //TabController 연결
                  children: [
                    // 첫 번째 탭의 내용
                    Center(
                      child: Text("첫번째"),
                    ),
                    // 두 번째 탭의 내용
                    ListView.separated(
                      itemCount: notifyModel.chatNotifyDTOList!.length, // 예시로 10개의 아이템을 표시
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(); // 각 아이템 사이에 구분선을 추가
                      },
                      itemBuilder: (BuildContext context, int index) {
                        Logger().d("+++ListTile Title: ${notifyModel!.chatNotifyDTOList![index].content}");
                        return ListTile(
                          title:
                            Text(
                                "${notifyModel!.chatNotifyDTOList![index].content}"),
                            //textAlign: TextAlign.start,
                          subtitle: Text('TimeStamp'),
                        );
                      },
                    ),
                    Center(
                      child: Text("첫번째"),
                    ),
                    Center(
                      child: Text("첫번째"),
                    ),
                    Center(
                      child: Text("첫번째"),
                    ),
                    Center(
                      child: Text("첫번째"),
                    ),
                    Center(
                      child: Text("첫번째"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    //페이지 소멸될 때 TabController 정리
    _tabController.dispose();
    super.dispose();
  }
}
