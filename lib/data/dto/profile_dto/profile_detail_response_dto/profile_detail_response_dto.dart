
class ProfileDetailResponseDTO{
  int? id;
  String? nickname;
  String? profileImage;
  String? backImage;
  String? statusMessage;

  ProfileDetailResponseDTO({
    this.id,
    this.nickname,
    this.profileImage,
    this.backImage,
    this.statusMessage
  });

  ProfileDetailResponseDTO.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    nickname = json["nickname"],
    profileImage = json["profileImage"],
    backImage = json["backImage"],
    statusMessage = json["statusMessage"];

}

