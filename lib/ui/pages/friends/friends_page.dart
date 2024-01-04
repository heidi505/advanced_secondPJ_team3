import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/theme.dart';

import '../../widgets/chatting_items/chatting_item.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ChattingItem(
            imagePath: "assets/images/basic_img.jpeg",
            title: "김하얀",
            subTitle: "3조 프로젝트 화이팅",
            multiItem: Container(
              height: 5,
              width: 3,
              decoration: BoxDecoration(
                color:Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
