import 'package:flutter/material.dart';

import 'color.dart';

TextStyle h1(
    {FontWeight fontWeight = FontWeight.w500, Color color = basicColorB3}) {
  return TextStyle(fontSize: 24, fontWeight: fontWeight, color: color);
}

TextStyle h2(
    {FontWeight fontWeight = FontWeight.w500, Color color = basicColorB3}) {
  return TextStyle(fontSize: 20, fontWeight: fontWeight, color: color);
}

TextStyle h3(
    {FontWeight fontWeight = FontWeight.w400, Color color = basicColorB3}) {
  return TextStyle(fontSize: 18, fontWeight: fontWeight, color: color);
}

TextStyle h4(
    {FontWeight fontWeight = FontWeight.w400, Color color = basicColorB3}) {
  return TextStyle(fontSize: 16, fontWeight: fontWeight, color: color);
}

TextStyle h5(
    {FontWeight fontWeight = FontWeight.w400, Color color = basicColorB3}) {
  return TextStyle(fontSize: 14, fontWeight: fontWeight, color: color);
}

TextStyle h6(
    {FontWeight fontWeight = FontWeight.w400, Color color = basicColorB3}) {
  return TextStyle(fontSize: 12, fontWeight: fontWeight, color: color);
}

TextStyle subText(
    {FontWeight fontWeight = FontWeight.w400, Color color = basicColorB3}) {
  return TextStyle(fontSize: 10, fontWeight: fontWeight, color: color);
}
