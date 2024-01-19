import 'package:cloud_firestore/cloud_firestore.dart';

class NotifyItem{
  int? chatId;
  String? content;
  Timestamp? createdAt;
  int? userId;

  NotifyItem({ this.chatId,this.content, this.createdAt, this.userId});

  Map<String, dynamic> toJson() => {"chatId" : chatId ,"content":content, "createdAt":createdAt, "userId":userId};
}

