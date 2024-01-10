import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//하얀
String baseUrl = "http://192.168.0.201:80";
// http 통신
final dio = Dio(
  BaseOptions(
      baseUrl: baseUrl, // 내 IP 입력
      contentType: "application/json; charset=utf-8"),
);

// 휴대폰 로컬에 파일로 저장
const secureStorage = FlutterSecureStorage();
