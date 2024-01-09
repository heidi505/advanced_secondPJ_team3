import 'package:cloud_firestore/cloud_firestore.dart';

class ChatroomDTO{
  int? peopleCount;
  int? messageCount;
  String? lastChat;
  String? lastChatTime;
  String? chatName;
  int? chatId;
  String? chatDocId;
  List<MessageDTO>? messageList;

  ChatroomDTO(
  {this.peopleCount,
    this.messageCount,
    this.lastChat,
    this.lastChatTime,
    this.chatName,
    this.chatId,
    this.chatDocId,
    this.messageList});

}


class MessageDTO {
  String? content;
  Timestamp? createdAt;
  int? messageId;
  int? userId;
  String? messageDocId;

  MessageDTO({this.content, this.createdAt, this.messageId, this.userId, this.messageDocId});
}