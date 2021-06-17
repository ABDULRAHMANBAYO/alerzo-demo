import 'package:alerzo_demo/utils/assets_colors.dart';
import 'package:flutter/material.dart';

nameTextStyle(width) => TextStyle(
    fontFamily: "Regular",
    fontSize: width * 0.07,
    color: AssetColors.titleTextColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700);
informationTextStyle(height, width) => TextStyle(
    fontFamily: "Light",
    height: height * 0.0025,
    fontSize: width * 0.04,
    color: AssetColors.subTextColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400);
titleTextStyle(width) => TextStyle(
    fontFamily: "Light",
    fontSize: width * 0.035,
    color: AssetColors.titleTextColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600);
subTitleTextStyle(width) => TextStyle(
    fontFamily: "Thin",
    fontSize: width * 0.032,
    color: AssetColors.subTextColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600);
