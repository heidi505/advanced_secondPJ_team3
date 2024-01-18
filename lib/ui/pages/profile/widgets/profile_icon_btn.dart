import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/chat_room/other_chat_view_model.dart';

class BottomIconButton extends ConsumerWidget {
  const BottomIconButton({
    Key? key,
    required this.imagePath,
    required this.text,
    this.routeToNavigate,
  }) : super(key: key);

  final String imagePath;
  final String text;
  final String? routeToNavigate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if (text == "1:1 채팅") {
          ref.read(otherChatProvider.notifier).getOneToOneChat();
        } else {
          Navigator.pushNamed(context, routeToNavigate!);
        }
      },
      child: Column(
        children: [
          Image.asset(
            imagePath,
            color: basicColorW,
            fit: BoxFit.cover,
            width: 25,
            height: 25,
          ),
          const SizedBox(
            height: smallGap,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
