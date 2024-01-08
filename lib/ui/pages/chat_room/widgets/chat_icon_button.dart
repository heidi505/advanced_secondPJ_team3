import 'package:flutter/material.dart';

class ChatIconButton extends StatelessWidget {
  final icon;
  const ChatIconButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: icon,
      iconSize: 25,
    );
  }
}
