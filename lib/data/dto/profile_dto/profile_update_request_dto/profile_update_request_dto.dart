class ProfileUpdateRequestDTO {
  int? id;
  String? nickname;
  String? statusMessage;

  ProfileUpdateRequestDTO({
      this.id,
      this.nickname,
      this.statusMessage,
  });

  Map<String, dynamic> toJson() =>
      {
        "id": id, "nickname": nickname, "statusMessage": statusMessage};
}
