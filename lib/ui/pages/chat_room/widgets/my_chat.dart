
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';

class MyChat extends StatelessWidget {
  MyChat({
    Key? key,
    required this.text,
    required this.time,
    this.isPhoto = false
  }) : super(key: key);

  final String text;
  final String time;
  bool isPhoto;

  @override
  Widget build(BuildContext context) {
    if(!isPhoto){
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
    }else{
      String filePath = text.split("'")[1];
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(time, style: const TextStyle(fontSize: 12)),
                const SizedBox(width: 5),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 50.0, horizontal: 50.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: FileImage(File(filePath)),
                      fit: BoxFit.contain
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

  }
}
