import 'package:flutter/widgets.dart';

import '../../../core/utils/constant/app_images.dart';
import '../../../core/utils/extension/extension.dart';

class OrderModel {
  final String imageOne, imageTwo, title, price, items, code;

  OrderModel({
    required this.imageOne,
    required this.imageTwo,
    required this.title,
    required this.price,
    required this.items,
    required this.code,
  });
}

List<OrderModel> orderItems(BuildContext context) {
  return [
    OrderModel(
      imageOne: AppImages.kAppleGrapeJuice,
      imageTwo: AppImages.kBellPepperRed,
      title: context.kAppLocalizations.processing,
      price: "20.99",
      items: "02",
      code: "#12365",
    ),
    OrderModel(
      imageOne: AppImages.kEggChickenRed,
      imageTwo: AppImages.kEggChickenWhite,
      title: context.kAppLocalizations.processing,
      price: "3.50",
      items: "02",
      code: "#12358",
    ),
    OrderModel(
      imageOne: AppImages.kBroilerChicken,
      imageTwo: AppImages.kBeefBone,
      title: context.kAppLocalizations.processing,
      price: "12.99",
      items: "02",
      code: "#12345",
    ),
    OrderModel(
      imageOne: AppImages.kRedApple,
      imageTwo: AppImages.kOrganicBananas,
      title: context.kAppLocalizations.processing,
      price: "11.99",
      items: "02",
      code: "#12356",
    ),
    OrderModel(
      imageOne: AppImages.kOrangeJuice,
      imageTwo: AppImages.kRoundCutEggNoodles,
      title: context.kAppLocalizations.processing,
      price: "30.99",
      items: "02",
      code: "#12379",
    ),
    OrderModel(
      imageOne: AppImages.kCocaColaCan,
      imageTwo: AppImages.kDietCoca,
      title: context.kAppLocalizations.processing,
      price: "7.99",
      items: "02",
      code: "#12379",
    ),
    OrderModel(
      imageOne: AppImages.kPepsiCan,
      imageTwo: AppImages.kEggPasta,
      title: context.kAppLocalizations.processing,
      price: "20.99",
      items: "02",
      code: "#12379",
    ),
  ];
}
