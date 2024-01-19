class ProfileUpdateRequestDTO {
  int? id;
  String? nickname;
  String? statusMessage;
  String? profileImage;
  String? backImage;

  ProfileUpdateRequestDTO(
      {this.id,
      this.nickname,
      this.statusMessage,
      this.profileImage,
      this.backImage});

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "statusMessage": statusMessage,
        "profileImage": profileImage,
        "backImage": backImage
      };
}
