import 'package:flutter/material.dart';

import 'color.dart';

TextStyle h1({
  FontWeight fontWeight = FontWeight.w500,
}) {
  return TextStyle(fontSize: 24, fontWeight: fontWeight, color: basicColorB1);
}

TextStyle h2({
  FontWeight fontWeight = FontWeight.w500,
}) {
  return TextStyle(fontSize: 20, fontWeight: fontWeight, color: basicColorB1);
}

TextStyle h3({
  FontWeight fontWeight = FontWeight.w400,
}) {
  return TextStyle(fontSize: 18, fontWeight: fontWeight, color: basicColorB3);
}

TextStyle h4({
  FontWeight fontWeight = FontWeight.w400,
}) {
  return TextStyle(fontSize: 16, fontWeight: fontWeight, color: basicColorB3);
}

TextStyle h5({
  FontWeight fontWeight = FontWeight.w400,
}) {
  return TextStyle(fontSize: 14, fontWeight: fontWeight, color: basicColorB7);
}

TextStyle h6({
  FontWeight fontWeight = FontWeight.w400,
}) {
  return TextStyle(fontSize: 12, fontWeight: fontWeight, color: basicColorB9);
}