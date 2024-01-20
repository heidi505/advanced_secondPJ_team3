class FriendSearchResponseDTO{
  int? id;
  String? nickname;
  String? phoneNum;
  String? statusMessage;
  String? profileImage;
  String? backImage;
  String? birthdate;

  FriendSearchResponseDTO({
    this.id,
    this.nickname,
    this.phoneNum,
    this.statusMessage,
    this.profileImage,
    this.backImage,
    this.birthdate
  });

  FriendSearchResponseDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        nickname = json["nickname"],
        phoneNum = json["phoneNum"],
        statusMessage = json["statusMessage"],
        profileImage = json["profileImage"],
        backImage = json["backImage"],
        birthdate = json["birthdate"];

  @override
  String toString() {
    return 'FriendSearchResponseDTO{id: $id, nickname: $nickname, phoneNum: $phoneNum, statusMessage: $statusMessage, profileImage: $profileImage, backImage: $backImage, birthdate: $birthdate}';
  }

}
