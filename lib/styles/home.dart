import 'package:alerzo_demo/utils/assets_colors.dart';
import 'package:flutter/material.dart';

nameTextStyle(width) => TextStyle(
    fontSize: width * 0.07,
    color: AssetColors.titleTextColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700);
informationTextStyle(height, width) => TextStyle(
    height: height * 0.0025,
    fontSize: width * 0.04,
    color: AssetColors.subTextColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400);
titleTextStyle(width) => TextStyle(
    fontSize: width * 0.035,
    color: AssetColors.titleTextColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400);
subTitleTextStyle(width) => TextStyle(
    fontSize: width * 0.033,
    color: AssetColors.subTextColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400);
