
class ProfileImageDeleteResponseDTO{
  int? id;
  String? backImage;

  ProfileImageDeleteResponseDTO({
    this.id,
    this.backImage
  });

  Map<String, dynamic> toJson(){
    return{
      "id": id,
      "profileImage": backImage
    };
  }

}