import 'package:cloud_firestore/cloud_firestore.dart';

class message{
  String? content;
  Timestamp? createdAt;
  int? userId;

  message({this.content, this.createdAt, this.userId});

  Map<String, dynamic> toJson() => {"content":content, "createdAt":createdAt, "userId":userId};
}