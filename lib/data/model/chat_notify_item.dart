import 'package:cloud_firestore/cloud_firestore.dart';

class NotifyItem{
  String? content;
  Timestamp? createdAt;
  int? notifyId;
  int? userId;

  NotifyItem({this.content, this.createdAt, this.notifyId, this.userId});

  Map<String, dynamic> toJson() => {"content":content, "createdAt":createdAt, "notifyId" : notifyId ,"userId":userId};
}

