import 'package:team3_kakao/data/model/user.dart';

class ResponseDTO {
  final bool? success;
  dynamic? data;
  ErrorType? errorType; // response field is dynamic
  String? token;

  ResponseDTO({this.data, this.success, this.errorType});

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : success = json["success"],
        data = json["data"],
        errorType = json["errorType"] == null
            ? null
            : ErrorType.fromJson(json["errorType"]);

  @override
  String toString() {
    return 'ResponseDTO{token: $token, data: $data, success: $success, error: $errorType}';
  }

// response에만 쓰니까 toJson은 필요없다
}

class ErrorType {
  String? message;
  int? status;

  ErrorType({this.message, this.status});

  ErrorType.fromJson(Map<String, dynamic> json)
      : message = json["message"],
        status = json["status"];

  @override
  String toString() {
    return 'ErrorType{message: $message, status: $status}';
  }

}
