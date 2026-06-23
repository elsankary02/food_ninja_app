import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button_pop.dart';
import '../../../../../core/components/custom_plus_and_minus.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/extension/extension.dart';

class CartDetailsWidget extends StatelessWidget {
  final String image, title, subtitle, price;
  final void Function()? minusOnTap, plusOnTap, onPressed;
  final int count;
  const CartDetailsWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    this.minusOnTap,
    this.plusOnTap,
    this.count = 1,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: context.height * 0.010),
      padding: EdgeInsets.symmetric(horizontal: context.height * 0.015),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.height * 0.022),
        color: context.kChangeTheme.primaryColor,
        border: Border.all(color: context.kChangeTheme.primaryColorLight),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(context.height * 0.016),
          child: Image.asset(
            image,
            fit: BoxFit.scaleDown,
            width: context.height * 0.085,
            height: context.height * 0.085,
          ),
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.kTextTheme.titleMedium!.copyWith(
                        color: context.kChangeTheme.hintColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: context.kTextTheme.labelLarge!.copyWith(
                        color: AppColors.kGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                CustomIconButton(
                  icon: Icon(Icons.close, size: context.height * 0.024),
                  onPressed: onPressed,
                ),
              ],
            ),
            SizedBox(height: context.height * 0.012),
            CustomPlusAndMinus(
              minusOnTap: minusOnTap,
              count: count,
              plusOnTap: plusOnTap,
              price: price,
            ),
          ],
        ),
      ),
    );
  }
}
