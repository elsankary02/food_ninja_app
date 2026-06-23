import 'package:flutter/widgets.dart';

import '../../../core/utils/constant/app_images.dart';
import '../../../core/utils/extension/extension.dart';

class GroceriesModel {
  final String image, title, subTitle, price, description;
  int count;
  GroceriesModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.description,
    this.count = 1,
  });
}

List<GroceriesModel> groceriesModel(BuildContext context) {
  return [
    GroceriesModel(
      image: AppImages.kBeefBone,
      title: context.kAppLocalizations.beefbone,
      subTitle: context.kAppLocalizations.beefbonesubtitle,
      price: r"$4.99",
      description: context.kAppLocalizations.beefbonedescription,
    ),
    GroceriesModel(
      image: AppImages.kBroilerChicken,
      title: context.kAppLocalizations.broilerchicken,
      subTitle: context.kAppLocalizations.broilerchickensubtitle,
      price: r"$4.99",
      description: context.kAppLocalizations.broilerchickendescription,
    ),

    GroceriesModel(
      image: AppImages.kEggChickenRed,
      title: context.kAppLocalizations.eggchickenred,
      subTitle: context.kAppLocalizations.eggchickenredsubtitle,
      price: r"$1.99",
      description: context.kAppLocalizations.eggchickenreddescription,
    ),
    GroceriesModel(
      image: AppImages.kEggChickenWhite,
      title: context.kAppLocalizations.eggchickenwhite,
      subTitle: context.kAppLocalizations.eggchickenwhitesubtitle,
      price: r"$1.50",
      description: context.kAppLocalizations.eggchickenwhitedescription,
    ),
    GroceriesModel(
      image: AppImages.kEggPasta,
      title: context.kAppLocalizations.eggpasta,
      subTitle: context.kAppLocalizations.eggpastasubtitle,
      price: r"$15.99",
      description: context.kAppLocalizations.eggpastadescription,
    ),
    GroceriesModel(
      image: AppImages.kEggNoodles,
      title: context.kAppLocalizations.eggnoodles,
      subTitle: context.kAppLocalizations.eggnoodlessubtitle,
      price: r"$15.99",
      description: context.kAppLocalizations.eggnoodlesdescription,
    ),
    GroceriesModel(
      image: AppImages.kMayonnaisEggless,
      title: context.kAppLocalizations.mayonnaiseggless,
      subTitle: context.kAppLocalizations.mayonnaisegglesssubtitle,
      price: r"$4.99",
      description: context.kAppLocalizations.mayonnaisegglessdescription,
    ),
    GroceriesModel(
      image: AppImages.kRoundCutEggNoodles,
      title: context.kAppLocalizations.roundcuteggnoodles,
      subTitle: context.kAppLocalizations.roundcuteggnoodlessubtitle,
      price: r"$4.99",
      description: context.kAppLocalizations.roundcuteggnoodlesdescription,
    ),
    GroceriesModel(
      image: AppImages.kGinger,
      title: context.kAppLocalizations.ginger,
      subTitle: context.kAppLocalizations.gingersubtitle,
      price: r"$4.99",
      description: context.kAppLocalizations.gingerdescription,
    ),
    GroceriesModel(
      image: AppImages.kBellPepperRed,
      title: context.kAppLocalizations.bellpeppered,
      subTitle: context.kAppLocalizations.bellpepperredsubtitle,
      price: r"$4.99",
      description: context.kAppLocalizations.bellpeppereddescription,
    ),
    GroceriesModel(
      image: AppImages.kRedApple,
      title: context.kAppLocalizations.redapple,
      subTitle: context.kAppLocalizations.redapplesubtitle,
      price: r"$4.99",
      description: context.kAppLocalizations.redappledescription,
    ),
    GroceriesModel(
      image: AppImages.kOrganicBananas,
      title: context.kAppLocalizations.organicbananas,
      subTitle: context.kAppLocalizations.organicbananassubtitle,
      price: r"$3.00",
      description: context.kAppLocalizations.organicbananasdescription,
    ),
  ];
}
