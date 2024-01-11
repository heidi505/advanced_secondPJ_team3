
class MyProfileImageDeleteResponseDTO{
  int? id;
  String? profileImage;

  MyProfileImageDeleteResponseDTO({
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