
class MyProfileImageDeleteResponseDTO{
  int? id;
  String? backImage;

  MyProfileImageDeleteResponseDTO({
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