
class ProfileBackImageDeleteResponseDTO{
  int id;
  String backImage;

  ProfileBackImageDeleteResponseDTO(
    this.id,
    this.backImage
  );

  ProfileBackImageDeleteResponseDTO.fromJson(Map<String, dynamic> json)
  : id = json["id"],
    backImage = json["backImage"];

}