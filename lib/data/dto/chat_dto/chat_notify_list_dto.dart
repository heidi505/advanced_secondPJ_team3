
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatNotifyDTO{
  int? chatId;
  int? userId;
  late String content;
  Timestamp? createdAt;
  int? chatNotifyDocId;

  ChatNotifyDTO({ this.chatId, this.userId, required this.content,this.createdAt, this.chatNotifyDocId});

  ChatNotifyDTO.fromJson(Map<String, dynamic> json, String id ) //id : chatNotify 컬렉션 id
  { content = json["content"];
  createdAt = json["createdAt"];
  userId = json["userId"];
  }
}