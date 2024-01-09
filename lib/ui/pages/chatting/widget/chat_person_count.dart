import 'package:flutter/material.dart';

class ChatPersonCount extends StatelessWidget {
  const ChatPersonCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("채팅방 제목", style: TextStyle(color: Colors.black),),
        Text("4", style: TextStyle(color: Colors.grey),)
      ],
    );
  }
}
