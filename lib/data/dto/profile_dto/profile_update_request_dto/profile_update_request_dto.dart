class ProfileUpdateRequestDTO{
  int? id;
  String? nickname;
  String? statusMessage;
  String? profileImage;
  String? backImage;

  ProfileUpdateRequestDTO({
    this.id,
    this.nickname,
    this.statusMessage,
    this.profileImage,
    this.backImage
  });

  Map<String, dynamic> toJson(){
    return{
      "id":this.id,
      "nickname":this.nickname,
      "statusMessage":this.statusMessage,
      "profileImage":this.profileImage,
      "backImage":this.backImage
    };
  }
}

