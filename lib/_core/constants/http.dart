import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//은지
String baseUrl = "http://192.168.0.19:8080";

//하얀
// String baseUrl = "http://192.168.0.165:8080";
// String baseUrl = "http://172.30.1.98:8080";
// String baseUrl = "http://192.168.45.180:8080";
// String baseUrl = "http://192.168.0.201:8080";
//혜림
// String baseUrl = "http://192.168.0.57:8080";
//누군가의 baseUrl
// String baseUrl = "http://192.168.45.50:8080";
// 박남규
// String baseUrl = "http://192.168.0.71:8080";
// 민경

//String baseUrl = "http://192.168.0.62:8080";
//   String baseUrl = "http://192.168.0.62:8080";

// http 통신
final dio = Dio(
  BaseOptions(
      baseUrl: baseUrl, // 내 IP 입력
      contentType: "application/json; charset=utf-8"),
);

// 휴대폰 로컬에 파일로 저장
const secureStorage = FlutterSecureStorage();
