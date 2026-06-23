import 'package:flutter/material.dart';

import '../../../core/utils/theme/app_colors.dart';
import '../../../core/utils/constant/app_images.dart';
import '../../../core/utils/extension/extension.dart';

class ExploreModel {
  final String image, title;
  final String? subTitle, price, description;
  final Color? color;
  int count;
  ExploreModel({
    required this.image,
    required this.title,
    this.color,
    this.subTitle,
    this.price,
    this.description,
    this.count = 1,
  });
}

List<ExploreModel> exploreModel(BuildContext context) {
  return [
    ExploreModel(
      image: AppImages.kRice,
      title: context.kAppLocalizations.rice,
      subTitle: context.kAppLocalizations.ricesubtitle,
      price: r"$2.99",
      description: context.kAppLocalizations.ricedsescription,
      color: AppColors.kRice,
    ),
    ExploreModel(
      image: AppImages.kPulses,
      title: context.kAppLocalizations.pulses,
      subTitle: context.kAppLocalizations.pulsessubtitle,
      price: r"$4.99",
      description: context.kAppLocalizations.pulsesdescription,
      color: AppColors.kPulses,
    ),
    ExploreModel(
      image: AppImages.kFreshFruits,
      title: context.kAppLocalizations.freshfruitsvegetablestitle,
      subTitle: context.kAppLocalizations.freshfruitsvegetablessubtitle,
      price: r"$4.99",
      description: context.kAppLocalizations.freshfruitsvegetablesdescription,
      color: AppColors.kRice,
    ),
  ];
}
