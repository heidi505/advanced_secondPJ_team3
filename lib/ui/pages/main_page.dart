import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/chatting_count.dart';
import 'package:team3_kakao/ui/pages/friends/friends_page.dart';
import 'package:team3_kakao/ui/pages/my_info/my_info_page.dart';
import 'package:team3_kakao/ui/pages/open_chatting/open_chatting_page.dart';

import '../../_core/constants/color.dart';
import '../../_core/constants/theme.dart';
import '../widgets/navigation/com_navigation_item.dart';
import 'chatting/chatting_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController? _tabController;

  get count => 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _onTabbed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          FriendsPage(),
          ChattingPage(),
          OpenChattingPage(),
          MyInfoPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
          navigationItem.length,
          (index) => _buildBottomNavigationBarItem(
            id: navigationItem[index].id,
            icon: navigationItem[index].icon,
            label: navigationItem[index].label,
            imgUrl: navigationItem[index].imgUrl,
          ),
        ),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: basicColorB3,
        unselectedItemColor: basicColorB9,
        backgroundColor: Colors.white,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        onTap: _onTabbed,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    int? id,
    String? icon,
    String? label,
    String? imgUrl,
  }) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: SizedBox(
              child: SvgPicture.asset(
                "${icon}",
                width: 24,
                height: 24,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: (id != 3 && id != 0) ? ChattingCount() : SizedBox.shrink(),
          ),
        ],
      ),
      activeIcon: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: SizedBox(
              child: SvgPicture.asset(
                "${imgUrl}",
                width: 24,
                height: 24,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: (id != 3 && id != 0) ? ChattingCount() : SizedBox.shrink(),
          ),
        ],
      ),
      label: "${label}",
    );
  }
}
