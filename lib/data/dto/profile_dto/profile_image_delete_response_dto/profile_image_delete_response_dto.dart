
class ProfileImageDeleteResponseDTO{
  int? id;
  String? profileImage;

  ProfileImageDeleteResponseDTO({
    this.id,
    this.profileImage
  });

  Map<String, dynamic> toJson(){
    return{
      "id": id,
      "profileImage": profileImage
    };
  }

}