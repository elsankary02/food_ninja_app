import 'package:flutter/material.dart';

import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/extension/extension.dart';

class FavouriteDetailsWidget extends StatelessWidget {
  final String image, title, subtitle, price;
  final void Function()? onTap;
  const FavouriteDetailsWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsDirectional.only(bottom: context.height * 0.010),
        padding: EdgeInsets.symmetric(
          horizontal: context.height * 0.015,
          vertical: context.height * 0.020,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.height * 0.022),
          color: context.kChangeTheme.primaryColor,
          border: Border.all(color: context.kChangeTheme.primaryColorLight),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: context.height * 0.014,
          ),
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
                  Text(
                    price,
                    style: context.kTextTheme.titleMedium!.copyWith(
                      color: context.kChangeTheme.hintColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
