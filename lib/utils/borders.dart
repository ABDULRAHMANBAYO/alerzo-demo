import 'package:flutter/material.dart';
import 'assets_colors.dart';

InputBorder focused = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(width: 1, color: AssetColors.primaryColor));
InputBorder disabled = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(width: 1, color: AssetColors.borderColor));
InputBorder enabled = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(width: 1, color: AssetColors.borderColor));
InputBorder error = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(width: 1, color: AssetColors.errColor));
InputBorder focusedError = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(width: 1, color: AssetColors.errColor));
