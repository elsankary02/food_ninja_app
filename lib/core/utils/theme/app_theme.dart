import 'package:flutter/material.dart';

import 'app_colors.dart';
import '../constant/app_strings.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.kWhite,
    primaryColorLight: AppColors.kBorder,
    hintColor: AppColors.kTitle,
    scaffoldBackgroundColor: AppColors.kWhite,
    fontFamily: kGilroy,
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.kContainerColor,
    primaryColorLight: AppColors.kContainerColor,
    hintColor: AppColors.kWhite,
    scaffoldBackgroundColor: AppColors.kBlack,
    fontFamily: kGilroy,
  );
}
