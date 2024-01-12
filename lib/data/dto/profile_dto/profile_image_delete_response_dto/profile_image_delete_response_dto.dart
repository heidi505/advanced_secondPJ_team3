
class ProfileImageDeleteResponseDTO{
  int id;
  String profileImage;

  ProfileImageDeleteResponseDTO(
    this.id,
    this.profileImage
  );

  ProfileImageDeleteResponseDTO.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    profileImage = json["profileImage"];
}