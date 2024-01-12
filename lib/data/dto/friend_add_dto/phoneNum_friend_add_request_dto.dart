
class PhoneNumFriendAddRequestDTO {
  int? id;
  String? phoneNum;

  PhoneNumFriendAddRequestDTO({this.id, this.phoneNum});

  Map<String, dynamic> toJson() {
    return {
      "id":this.id,
      "phoneNum":this.phoneNum
    };
  }
}