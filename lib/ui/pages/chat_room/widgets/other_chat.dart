import 'package:flutter/material.dart';
import 'package:team3_kakao/data/model/user.dart';

class OtherChat extends StatelessWidget {
  final String name;
  final String text;
  final String time;
  const OtherChat({
    super.key,
    required this.name,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(friends[0].backgroundImage),
        ),
        SizedBox(width: 10),
        Flexible(
          child: Column(
            children: [
              Text(name),
              Container(
                child: Text(text),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 5),
        Text(
          time,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
