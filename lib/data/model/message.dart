import 'package:cloud_firestore/cloud_firestore.dart';

class message {
  String? content;
  Timestamp? createdAt;
  int? userId;

  message({this.content, this.createdAt, this.userId});

  Map<String, dynamic> toJson() =>
      {"content": content, "createdAt": createdAt, "userId": userId};
}

class Photo {
  String? content;
  Timestamp? createdAt;
  int? userId;
  bool? isPhoto;

  Photo({this.content, this.createdAt, this.userId, this.isPhoto});

  Map<String, dynamic> toJson() => {
        "content": content,
        "createdAt": createdAt,
        "userId": userId,
        "isPhoto": isPhoto
      };
}
