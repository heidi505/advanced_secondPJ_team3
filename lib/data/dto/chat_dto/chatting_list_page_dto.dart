import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/data/model/user_mock.dart';

class ChatroomDTO {
  String? peopleCount;
  int? messageCount;
  String? lastChat;
  String? lastChatTime;
  String? chatName;
  int? chatId;
  String? chatDocId;
  List<MessageDTO>? messageList;
  List<int>? userIdList;
  CollectionReference? messageCollection;

  ChatroomDTO(
      {this.peopleCount,
      this.messageCount,
      this.lastChat,
      this.lastChatTime,
      this.chatName,
      this.chatId,
      this.chatDocId,
      this.messageList,
      this.userIdList,
      this.messageCollection});

  ChatroomDTO.fromJson(Map<String, dynamic> json, String docId) {
    chatName = json["chatName"];
    userIdList = List<int>.from(json["users"]);
    peopleCount = userIdList!.length.toString();
    chatDocId = docId;
  }
}

class MessageDTO {
  late String content;
  Timestamp? createdAt;
  int? messageId;
  int? userId;
  String? messageDocId;
  String? time;
  String? userNickname;
  bool? isPhoto;

  MessageDTO(
      {required this.content,
      this.createdAt,
      this.messageId,
      this.userId,
      this.messageDocId,
      this.time,
      this.userNickname,
      this.isPhoto});

  MessageDTO.fromJson(Map<String, dynamic> json, String docId) {
    content = json["content"];
    createdAt = json["createdAt"];
    userId = json["userId"];
    isPhoto = json["isPhoto"];
    messageDocId = docId;
    if (this.createdAt!.toDate().hour >= 12) {
      time = "오후 " +
          (createdAt!.toDate().hour - 12).toString() +
          ":" +
          createdAt!.toDate().minute.toString();
    } else {
      time = "오전 " +
          createdAt!.toDate().hour.toString() +
          ":" +
          createdAt!.toDate().minute.toString();
    }
  }
}
