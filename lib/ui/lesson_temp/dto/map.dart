import 'package:logger/logger.dart';

class MapSample{


  void mapTest(){

    //맵 만들기
    Map<String, dynamic> map = {
      "userId":1
    };

    Map<String, dynamic> sample2 = {
      "success" : true,
      "data" : {
        "userId":1,
        "userNickname":"최죠"
      },
      "errorType" : null
    };

    Map<String, dynamic> sample3 = {
      "success" : true,
      "data" : {
        "userId" : 1,
        "userNickname" : "나야나"
      },
      "errorType" : null
    };

    //맵 꺼내오기
    Logger().d(map["userId"]);

    Logger().d("User Nickname : ${sample3["data"]["userNickname"]}");
}

  MapSample();
}