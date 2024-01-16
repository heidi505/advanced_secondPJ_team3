class Profile{
  int? id;
  String? profileImage;
  String? statusMessage;
  String? backImage;
  String? qrCode;
  int? userId;

  Profile({this.id, this.profileImage, this.statusMessage, this.backImage,
      this.qrCode, this.userId});

  Map<String, dynamic> toJson()=>{
    "id":id,
    "profileImage":profileImage,
    "sletatusMessage":statusMessage,
    "backImage":backImage,
    "qrCode":qrCode,
    "userId":userId
  };

  Profile.fromJson(Map<String, dynamic> json)
    : id = json["id"],
      profileImage = json["profileImage"],
      statusMessage = json["statusMessage"],
      backImage = json["backImage"],
      qrCode = json["qrCode"],
      userId = json["userId"];

}