
class ProfileDetailResponseDTO{
  int id;
  String nickname;
  String statusMessage;
  String profileImage;
  String backImage;

  ProfileDetailResponseDTO(
    this.id,
    this.nickname,
    this.statusMessage,
    this.profileImage,
    this.backImage
  );

  ProfileDetailResponseDTO.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    nickname = json["nickname"],
    statusMessage = json["statusMessage"],
    profileImage = json["profileImage"],
    backImage = json["backImage"];
}

