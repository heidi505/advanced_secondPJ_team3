class RespDTO {
  int userId;
  String userNickname;
  String userPhoneNum;

  RespDTO(this.userId, this.userNickname, this.userPhoneNum);

  RespDTO.fromJson(Map<String, dynamic> json)
  : userId = json["userId"],
    userNickname = json["userNickName"],
    userPhoneNum = json["userPhoneNum"];
}