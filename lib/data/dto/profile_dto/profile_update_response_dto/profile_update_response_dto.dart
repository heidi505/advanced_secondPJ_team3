class ProfileUpdateResponseDTO{
  int? id;
  String? nickname;
  String? statusMessage;
  String? profileImage;
  String? backImage;

  ProfileUpdateResponseDTO({
    this.id,
    this.nickname,
    this.statusMessage,
    this.profileImage,
    this.backImage
  });

  ProfileUpdateResponseDTO.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    nickname = json["nickname"],
    statusMessage = json["statusMessage"],
    profileImage = json["profileImage"],
    backImage = json["backImage"];
}