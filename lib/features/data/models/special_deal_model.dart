import 'package:flutter/material.dart';

import '../../../core/utils/constant/app_images.dart';
import '../../../core/utils/extension/extension.dart';

class SpecialDealModel {
  final String image;
  final String title;
  final String buttonTitle;
  final Color specialColor, ordernowColor;

  SpecialDealModel({
    required this.ordernowColor,
    required this.specialColor,
    required this.image,
    required this.title,
    required this.buttonTitle,
  });
}

List<SpecialDealModel> specialDealItems(BuildContext context) {
  return [
    SpecialDealModel(
      image: AppImages.kEggChickenRed,
      title: context.kAppLocalizations.specialdealforoctober,
      buttonTitle: context.kAppLocalizations.buynow,
      ordernowColor: context.kChangeTheme.hintColor,
      specialColor: context.kChangeTheme.hintColor,
    ),
    SpecialDealModel(
      image: AppImages.kRice,
      title: context.kAppLocalizations.specialdealforoctober,
      buttonTitle: context.kAppLocalizations.buynow,
      ordernowColor: context.kChangeTheme.hintColor,
      specialColor: context.kChangeTheme.hintColor,
    ),
    SpecialDealModel(
      image: AppImages.kPulses,
      title: context.kAppLocalizations.specialdealforoctober,
      buttonTitle: context.kAppLocalizations.buynow,
      ordernowColor: context.kChangeTheme.hintColor,
      specialColor: context.kChangeTheme.hintColor,
    ),
    SpecialDealModel(
      image: AppImages.kSpriteCan,
      title: context.kAppLocalizations.specialdealforoctober,
      buttonTitle: context.kAppLocalizations.buynow,
      ordernowColor: context.kChangeTheme.hintColor,
      specialColor: context.kChangeTheme.hintColor,
    ),
    SpecialDealModel(
      image: AppImages.kPepsiCan,
      title: context.kAppLocalizations.specialdealforoctober,
      buttonTitle: context.kAppLocalizations.buynow,
      ordernowColor: context.kChangeTheme.hintColor,
      specialColor: context.kChangeTheme.hintColor,
    ),
  ];
}
