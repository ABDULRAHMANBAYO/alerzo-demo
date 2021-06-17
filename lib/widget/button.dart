import 'package:alerzo_demo/styles/login.dart';
import 'package:alerzo_demo/utils/assets_colors.dart';
import 'package:flutter/material.dart';

Widget submitButton(
        String buttonText, Function onPressed, double height, double width) =>
    ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(buttonText, style: buttonTextStyle(width)),
        style: ElevatedButton.styleFrom(
            elevation: 0.0,
            minimumSize: Size(width, 0.055 * height),
            primary: AssetColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0))));
