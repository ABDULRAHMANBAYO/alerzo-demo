import 'package:alerzo_demo/utils/assets_colors.dart';
import 'package:flutter/material.dart';

loginTextStyle(width) => TextStyle(
    fontFamily: 'Regular',
    fontSize: width * 0.06,
    color: AssetColors.titleTextColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700);
welcomeTextStyle(width, height) => TextStyle(
    fontFamily: 'Light',
    height: height * 0.0025,
    fontSize: width * 0.045,
    color: AssetColors.subTextColor,
    fontStyle: FontStyle.normal);
textFieldPlaceholderTextStyle(width) => TextStyle(
    fontFamily: 'Thin',
    fontSize: width * 0.04,
    color: AssetColors.titleTextColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500);
labelTextFieldTextStyle(width) => TextStyle(
    fontFamily: 'Thin',
    fontSize: width * 0.045,
    color: AssetColors.primaryColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600);
errorTextStyle(width) => TextStyle(
    fontFamily: 'Thin',
    fontSize: width * 0.035,
    color: AssetColors.errColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400);
textFieldTextStyle(width) => TextStyle(
    fontFamily: 'Thin',
    fontSize: width * 0.03,
    color: AssetColors.titleTextColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400);
buttonTextStyle(width) => TextStyle(
    fontFamily: 'Regular',
    fontSize: width * 0.045,
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700);
bottomTextOneStyle(width) => TextStyle(
      fontFamily: 'Light',
      fontSize: width * 0.045,
      color: AssetColors.subTextColor,
      fontStyle: FontStyle.normal,
    );
bottomTextTwoStyle(width) => TextStyle(
    fontFamily: 'Light',
    fontSize: width * 0.045,
    color: AssetColors.primaryColor,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700);
