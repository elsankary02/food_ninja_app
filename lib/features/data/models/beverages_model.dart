import 'package:flutter/widgets.dart';

import '../../../core/utils/constant/app_images.dart';
import '../../../core/utils/extension/extension.dart';

class BeveragesModel {
  final String image, title, subTitle, price, description;
  int count;
  BeveragesModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.description,
    this.count = 1,
  });
}

List<BeveragesModel> beveragesItems(BuildContext context) {
  return [
    BeveragesModel(
      image: AppImages.kPepsiCan,
      title: context.kAppLocalizations.pepsican,
      subTitle: context.kAppLocalizations.pepsicansubtitle,
      price: "\$4.99",
      description: context.kAppLocalizations.pepsidescription,
    ),
    BeveragesModel(
      image: AppImages.kCocaColaCan,
      title: context.kAppLocalizations.cocacolacan,
      subTitle: context.kAppLocalizations.cocacolacansubtitle,
      price: "\$4.99",
      description: context.kAppLocalizations.cocacoladescription,
    ),
    BeveragesModel(
      image: AppImages.kDietCoca,
      title: context.kAppLocalizations.dietcoke,
      subTitle: context.kAppLocalizations.dietcokesubtitle,
      price: "\$1.99",
      description: context.kAppLocalizations.dietcokedescription,
    ),
    BeveragesModel(
      image: AppImages.kSpriteCan,
      title: context.kAppLocalizations.spritecan,
      subTitle: context.kAppLocalizations.spritecansubtitle,
      price: "\$1.50",
      description: context.kAppLocalizations.spritedescription,
    ),
    BeveragesModel(
      image: AppImages.kAppleGrapeJuice,
      title: context.kAppLocalizations.applegrapejuice,
      subTitle: context.kAppLocalizations.applegrapejuicesubtitle,
      price: "\$15.99",
      description: context.kAppLocalizations.applegrapejuicedescription,
    ),
    BeveragesModel(
      image: AppImages.kOrangeJuice,
      title: context.kAppLocalizations.orangejuice,
      subTitle: context.kAppLocalizations.orangejuicesubtitle,
      price: "\$15.99",
      description: context.kAppLocalizations.orangejuicedescription,
    ),
  ];
}
