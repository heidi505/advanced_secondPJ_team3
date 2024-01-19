import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';

class MyChat extends StatelessWidget {
  const MyChat({
    Key? key,
    required this.text,
    required this.time,
  }) : super(key: key);

  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(time, style: const TextStyle(fontSize: 12)),
              const SizedBox(width: 5),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor01,
                  ),
                  child: Text(text),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
