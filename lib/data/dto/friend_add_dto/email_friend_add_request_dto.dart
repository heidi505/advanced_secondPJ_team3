class EmailFrinedAddRequestDTO {
  int id;
  String email;

  EmailFrinedAddRequestDTO(this.id, this.email);

  Map<String, dynamic> toJson() {
    return {
      "id":this.id,
      "email":this.email
    };
  }
}