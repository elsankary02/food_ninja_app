import 'package:flutter/material.dart';

import '../utils/constant/app_images.dart';
import '../utils/extension/extension.dart';

class CustomPlusAndMinus extends StatelessWidget {
  final void Function()? minusOnTap, plusOnTap;
  final String price;
  final int count;
  const CustomPlusAndMinus({
    super.key,
    required this.minusOnTap,
    required this.count,
    required this.plusOnTap,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: minusOnTap,
              child: Image.asset(AppImages.kIconMinus),
            ),
            SizedBox(width: context.height * 0.016),
            Text(
              count.toString(),
              style: context.kTextTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: context.kChangeTheme.hintColor,
              ),
            ),
            SizedBox(width: context.height * 0.016),
            GestureDetector(
              onTap: plusOnTap,
              child: Image.asset(AppImages.kIconPlus),
            ),
          ],
        ),
        Text(
          price,
          style: context.kTextTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: context.kChangeTheme.hintColor,
          ),
        ),
      ],
    );
  }
}
