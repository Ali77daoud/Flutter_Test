import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/color_constants.dart';

// final fillTextFormColor = HexColor("#C5C5C5");

final appTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
      //for status bar
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.blackLight,
          statusBarIconBrightness: Brightness.light),
      titleTextStyle: const TextStyle(
          color: AppColors.primaryDark, fontWeight: FontWeight.w600),
      iconTheme: const IconThemeData(color: AppColors.primaryDark),
      backgroundColor: Colors.grey.shade50,
      elevation: 0),
  // text form field theme
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.white,
    filled: true,
    errorMaxLines: 3,
    labelStyle: const TextStyle(
        color: AppColors.primaryLight, fontWeight: FontWeight.bold),
    floatingLabelStyle: const TextStyle(
      color: AppColors.primaryLight,
      fontWeight: FontWeight.bold,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          style: BorderStyle.solid, color: AppColors.primaryLight, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryLight, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
          style: BorderStyle.solid, width: 1, color: Colors.red),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          style: BorderStyle.solid, color: AppColors.primaryLight, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
          style: BorderStyle.solid, color: AppColors.primaryLight, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    prefixIconColor: AppColors.primaryLight,
    suffixIconColor: AppColors.primaryLight,
  ),
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: AppColors.primaryDark),
);
