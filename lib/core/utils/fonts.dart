import 'package:flutter/material.dart';
import 'package:sa7ty/core/utils/colors.dart';



TextStyle getheadtyle({double? size, FontWeight? weight, Color? color}){
  return TextStyle(
    fontSize: size?? 24,
    fontWeight:weight?? FontWeight.bold,
    color:color?? Appcolors.primary,
  );
}

TextStyle gettilestyle({double? size, FontWeight? weight, Color? color}){
  return TextStyle(
    fontSize: size?? 18,
    fontWeight:weight?? FontWeight.bold,
    color:color?? Appcolors.primary,
  );
}

TextStyle getmediamstyle({double? size, FontWeight? weight, Color? color}){
  return TextStyle(
    fontSize: size?? 16,
    fontWeight:weight?? FontWeight.normal,
    color:color?? Appcolors.dark,
  );
}

TextStyle getsmallstyle({double? size, FontWeight? weight, Color? color}){
  return TextStyle(
    fontSize: size?? 14,
    fontWeight:weight?? FontWeight.normal,
    color:color?? Appcolors.dark,
  );
}
