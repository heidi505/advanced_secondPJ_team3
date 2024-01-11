
class ProfileUpdateRequestDTO{
  int? id;
  String? nickname;
  String? statusMessage;
  String? profileImage;
  String? backImage;

  ProfileUpdateRequestDTO({
    this.id,
    this.nickname,
    this.profileImage,
    this.backImage,
    this.statusMessage
  });

  Map<String, dynamic> toJson(){
    return{
      "id":id,
      "nickname":nickname,
      "statusMessage":statusMessage,
      "profileImage":profileImage,
      "backImage":backImage
    };
  }

}

