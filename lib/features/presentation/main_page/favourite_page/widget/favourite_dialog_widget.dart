import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button_pop.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../../core/router/router.dart';

class FavouriteDialog extends StatelessWidget {
  final String image, title, subTitle, buttonTitle;
  const FavouriteDialog({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.zero,
      backgroundColor: context.kChangeTheme.primaryColor,
      actions: [
        Stack(
          children: [
            Image.asset(AppImages.kPatternBackground, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(context.height * 0.020),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomIconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => context.router.maybePop(),
                      ),
                    ],
                  ),
                  SizedBox(height: context.height * 0.018),
                  Image.asset(
                    image,
                    width: context.height * 0.222,
                    height: context.height * 0.222,
                  ),
                  SizedBox(height: context.height * 0.050),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: context.kTextTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.kChangeTheme.hintColor,
                    ),
                  ),
                  SizedBox(height: context.height * 0.020),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: context.kTextTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.kGrey,
                    ),
                  ),
                  SizedBox(height: context.height * 0.060),
                  CustomPrimaryButton(
                    title: buttonTitle,
                    style: context.kTextTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.kWhite,
                    ),
                    backGroundColor: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(19),
                    padding: EdgeInsets.symmetric(
                      vertical: context.height * 0.020,
                    ),
                    onTap: () {
                      context.router.maybePop();
                      context.router.push(OrdersRoute());
                    },
                  ),
                  SizedBox(height: context.height * 0.024),
                  UnconstrainedBox(
                    child: CustomPrimaryButton(
                      title: context.kAppLocalizations.backtohome,
                      style: context.kTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.kChangeTheme.hintColor,
                      ),
                      onTap: () => context.router.maybePop(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
