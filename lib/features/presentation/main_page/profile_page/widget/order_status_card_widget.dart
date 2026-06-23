import 'package:flutter/material.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/extension/extension.dart';

class OrderStatusCardWidget extends StatelessWidget {
  final String imageOne, imageTwo, title, price, items, code;
  final void Function()? trackOrderOnTap, cancelOntap;
  const OrderStatusCardWidget({
    super.key,
    required this.imageOne,
    required this.imageTwo,
    required this.title,
    required this.price,
    required this.items,
    required this.code,
    this.trackOrderOnTap,
    this.cancelOntap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: context.height * 0.010),
      padding: EdgeInsetsDirectional.only(
        start: context.height * 0.020,
        end: context.height * 0.020,
        bottom: context.height * 0.020,
      ),
      decoration: BoxDecoration(
        color: context.kChangeTheme.primaryColor,
        border: Border.all(color: context.kChangeTheme.primaryColorLight),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  imageOne,
                  width: context.height * 0.060,
                  height: context.height * 0.055,
                  fit: BoxFit.scaleDown,
                ),
                Positioned(
                  right: -10,
                  bottom: -20,
                  child: Image.asset(
                    imageTwo,
                    width: context.height * 0.060,
                    height: context.height * 0.055,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
            title: Text(
              title,
              style: context.kTextTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: context.kChangeTheme.hintColor,
              ),
            ),
            subtitle: Row(
              children: [
                Text(
                  "\$$price",
                  style: context.kTextTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.kChangeTheme.hintColor,
                  ),
                ),
                Text(
                  "  |  ",
                  style: context.kTextTheme.labelLarge!.copyWith(
                    color: AppColors.kGrey,
                  ),
                ),
                Text(
                  "${context.kAppLocalizations.items} $items",
                  style: context.kTextTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.kGrey,
                  ),
                ),
              ],
            ),
            trailing: Text(
              code,
              style: context.kTextTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.kGrey,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: context.height * 0.020),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPrimaryButton(
                title: context.kAppLocalizations.trackorder,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.kWhite,
                ),
                backGroundColor: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(8),
                padding: EdgeInsets.symmetric(
                  horizontal: context.height * 0.037,
                  vertical: context.height * 0.014,
                ),
                onTap: trackOrderOnTap,
              ),
              CustomPrimaryButton(
                title: context.kAppLocalizations.cancel,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.kPrimaryColor,
                ),
                border: Border.all(color: AppColors.kPrimaryColor),
                borderRadius: BorderRadius.circular(8),
                padding: EdgeInsets.symmetric(
                  horizontal: context.height * 0.055,
                  vertical: context.height * 0.014,
                ),
                onTap: cancelOntap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
