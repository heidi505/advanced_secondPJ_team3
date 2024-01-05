import 'package:flutter/material.dart';

class MyChat extends StatelessWidget {
  final String time;
  final String text;
  const MyChat({
    super.key,
    required this.time,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          time,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(width: 5),
        Flexible(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Color(0xFFfeec34),
          ),
          child: Text(text),
        ))
      ],
    );
  }
}
