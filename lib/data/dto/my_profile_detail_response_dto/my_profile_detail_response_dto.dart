
class MyProfileDetailResponseDTO{
  int? id;
  String? nickname;
  String? profileImage;
  String? backImage;
  String? statusMessage;

  MyProfileDetailResponseDTO({
    this.id,
    this.nickname,
    this.profileImage,
    this.backImage,
    this.statusMessage
  });

  Map<String, dynamic> toJson(){
    return{
      "id": id,
      "nickname": nickname,
      "profileImage": profileImage,
      "backImage": backImage,
      "statusMessage": statusMessage
    };
  }
}

