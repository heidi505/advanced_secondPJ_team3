import 'package:flutter/material.dart';

const double xsmallGap = 6.0;
const double smallGap = 10.0;
const double mediumGap = 20.0;
const double xmediumGap = 30.0;
const double largeGap = 40.0;
const double xlargeGap = 60.0;
const double xxlargeGap = 100.0;

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getDrawerWidth(BuildContext context) {
  return getScreenWidth(context) * 0.6;
}
