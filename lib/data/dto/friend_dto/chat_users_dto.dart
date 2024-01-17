class ChatUsersDTO{
  int? userId;
  int? profileId;
  String? userNickname;
  String? userProfileImage;

  ChatUsersDTO(
      this.userId, this.profileId, this.userNickname, this.userProfileImage);

  ChatUsersDTO.fromJson(Map<String, dynamic> json)
    : userId = json["userId"],
      profileId = json["profileId"],
      userNickname = json["userNickname"],
      userProfileImage = json["userProfileImage"];
}