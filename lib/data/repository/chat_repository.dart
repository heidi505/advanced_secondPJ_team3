import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/utils/date_format.dart';
import 'package:team3_kakao/data/dto/chat_dto/chatting_list_page_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/chat_users_dto.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/model/message.dart';
import 'package:team3_kakao/data/model/user.dart';

import '../../_core/constants/http.dart';

class ChatRepository{


  Future<List<MessageDTO>> getInitMessages(String chatRoomDocId, int userId) async {
    final db = FirebaseFirestore.instance;

    QuerySnapshot<Map<String, dynamic>> initMessages = await db
        .collection("ChatRoom1")
        .doc(chatRoomDocId)
        .collection("messages")
        .orderBy("createdAt", descending: false)
        .get();

    List<MessageDTO> dtoList = [];

    if(initMessages.docs.isEmpty){
      return dtoList;
    }

    for(var message in initMessages.docs){
      MessageDTO dto = MessageDTO.fromJson(message.data(), message.id);
      dtoList.add(dto);
    }

    return dtoList;
  }

  //통신
  Stream<List<MessageDTO>> fetchMessages(String chatRoomDocId, int userId){
    final db = FirebaseFirestore.instance;

    Stream<QuerySnapshot<Map<String, dynamic>>> stream = db
        .collection("ChatRoom1")
        .doc(chatRoomDocId)
        .collection("messages")
        .orderBy("createdAt", descending: false)
        .snapshots();


    return stream.map((snapshot){
      return snapshot.docs.map((e) {
        return MessageDTO.fromJson(e.data(), e.id);
      }).toList();
    });

  }

  //userId 받아야함!!
  Future<void> addMessage(String text, int userId, String chatRoomDocId) async {
    final db = FirebaseFirestore.instance;
    message msg = message(content: text,userId: userId, createdAt: Timestamp.now());

    final docRef = await db
        .collection("ChatRoom1")
        .doc(chatRoomDocId)
        .collection("messages")
        .add(msg.toJson());

  }

  Future<void> setChatting(String chatDocId, String func, int userId) async{
    final db = FirebaseFirestore.instance;

    final chatDoc = await db
        .collection("ChatRoom1")
        .doc(chatDocId);

    //alarm이면 기본값 true로 하는 로직 세팅해야함



    db.runTransaction((transaction)async{
      final snapshot = await transaction.get(chatDoc);

     bool currentState = snapshot.data()![func];
     bool newFunc = !currentState;

      transaction.update(chatDoc, {func : newFunc});
    });
  }

  Future<void> deleteChat(String chatDocId, int userId) async {
    final db = FirebaseFirestore.instance;

    await db
        .collection("ChatRoom1")
        .doc(chatDocId)
        .delete();
  }

  Future<ResponseDTO> getChatUsers(List<int?> userIdList, String jwt) async {
    Map<String, dynamic> userIdListToMap = {
      "userIdList" : userIdList
    };

    Response response = await dio.post("/user/get-chat-users", data: userIdListToMap, options: Options(headers: {"Authorization":"$jwt"}));

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);


    List<ChatUsersDTO> dtoList = (responseDTO.data as List).map((e) => ChatUsersDTO.fromJson(e)).toList();

    responseDTO.data = dtoList;

    return responseDTO;

  }

  Future<dynamic> insertOneToOneChat(User user, FriendsDTO friend) async {

    final db = FirebaseFirestore.instance;

      Map<String, dynamic> newChatRoom = {
        "chatName": "${user.nickname}, ${friend.nickname}",
        "isAlarmOn": true,
        "isBookMarked": false,
        "isFixed": false,
        "users": [user.id, friend.userId],
      };


      DocumentReference<Map<String, dynamic>> newChatDoc = await db.collection("ChatRoom1")
          .add(newChatRoom)
          .then((value) async { return value;});

      // Map<String, dynamic> newMessage = {
      //   "content": text,
      //   "createdAt": Timestamp.now(),
      //   "userId":user.id
      // };
      //
      // await db.collection("ChatRoom1").doc(newChatDoc.id).collection("messages").add(newMessage);

    return newChatDoc;


  }

}