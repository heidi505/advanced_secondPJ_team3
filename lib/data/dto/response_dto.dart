class ResponseDTO {
  final bool? success;
  dynamic data;
  final String? errorType; // response field is dynamic
  String? token;

  ResponseDTO({this.success, this.data, this.errorType});

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : success = json["success"],
        data = json["data"],
        errorType = json["errorType"];

}
