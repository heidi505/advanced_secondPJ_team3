class PhoneNumResponseDTO{
  String newPhoneNum;

  PhoneNumResponseDTO(this.newPhoneNum);


  PhoneNumResponseDTO.fromJson(Map<String, dynamic> json)
   : newPhoneNum = json["newPhoneNum"];
}