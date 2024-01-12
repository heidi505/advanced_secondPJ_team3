class ReqDTO {
  int userId;
  String nickname;


  ReqDTO(this.userId, this.nickname);


  Map<String, dynamic> toJson() => {"userId":this.userId, "nickname":this.nickname};
}