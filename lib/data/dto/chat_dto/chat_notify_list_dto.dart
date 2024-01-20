
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
  chatId = json["chatId"];
  //파이어베이스에서 들고오는 값이라
    //채팅방마다 각 공지를 뿌리려면 필요할듯..?
  }
}