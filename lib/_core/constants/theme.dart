import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';

const MaterialColor primaryWrite = MaterialColor(
  _writePrimaryValue,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
const int _writePrimaryValue = 0xFFFFFFFF;

ThemeData theme() {
  return ThemeData(
    textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor01),
    fontFamily: "NotoSansKR",
    scaffoldBackgroundColor: basicColorW,
    primaryColor: basicColorW,
    appBarTheme: appBarTheme(),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: basicColorB),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: primaryColor01,
        foregroundColor: basicColorB1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: primaryColor01), // 테두리 색상 설정
        ),
        minimumSize: Size(double.infinity, 46),
      ),
    ),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    titleTextStyle: TextStyle(color: basicColorB3, fontSize: 20),
    centerTitle: true,
    backgroundColor: primaryWrite,
    elevation: 0,
  );
}
