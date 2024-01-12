
class PhoneNumFriendAddResponseDTO {
  int id;
  String phoneNum;

  PhoneNumFriendAddResponseDTO(this.id, this.phoneNum);

  PhoneNumFriendAddResponseDTO.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    phoneNum = json["phoneNum"];
}