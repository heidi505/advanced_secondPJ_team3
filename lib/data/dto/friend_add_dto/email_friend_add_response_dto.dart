class EmailFriendAddResponseDTO {
  int id;
  String email;

  EmailFriendAddResponseDTO(this.id, this.email);

  EmailFriendAddResponseDTO.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    email = json["email"];
}