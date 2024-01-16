import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';

class ChattingCount extends StatelessWidget {
  const ChattingCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: pointColor03,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Text(
              "91",
              style: h6(color: basicColorW),
            ),
          ),
        ),
      ],
    );
  }
}
