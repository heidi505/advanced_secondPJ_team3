import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              icon: navigationItem[index].icon,
              label: navigationItem[index].label,
              imgUrl: navigationItem[index].imgUrl),
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

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {String? icon, String? label, String? imgUrl}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
          child: SvgPicture.asset(
            "${icon}",
            width: 24,
            height: 24,
          ),
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
          child: SvgPicture.asset(
            "${imgUrl}",
            width: 24,
            height: 24,
          ),
        ),
      ),
      label: "${label}",
    );
  }
}
