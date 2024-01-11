import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team3_kakao/ui/lesson_temp/dto/map.dart';

class MapTest extends StatelessWidget {
  const MapTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: (){
        MapSample().mapTest();
      }, child: Text("맵 테스트")),
    );
  }
}
