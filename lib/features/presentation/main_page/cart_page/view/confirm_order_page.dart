import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/components/custom_icon_button_pop.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/constant/app_svgs.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../../core/router/router.dart';

@RoutePage()
class ConfirmOrderPage extends StatelessWidget {
  const ConfirmOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.kPatternBackground, fit: BoxFit.cover),
          ListView(
            padding: EdgeInsetsDirectional.only(
              start: context.height * 0.020,
              end: context.height * 0.020,
              top: context.height * 0.060,
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomIconButton(
                    icon: Image.asset(
                      AppImages.kIconBack,
                      fit: BoxFit.scaleDown,
                      height: context.height * 0.045,
                      width: context.height * 0.045,
                    ),
                    onPressed: () => context.router.maybePop(),
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.020),
              Text(
                context.kAppLocalizations.confirmorder,
                style: context.kTextTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.kChangeTheme.hintColor,
                ),
              ),
              SizedBox(height: context.height * 0.020),
              Container(
                padding: EdgeInsets.all(context.height * 0.020),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: context.kChangeTheme.primaryColor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.kAppLocalizations.deliverto,
                          style: context.kTextTheme.labelLarge!.copyWith(
                            color: AppColors.kGrey,
                          ),
                        ),
                        CustomPrimaryButton(
                          title: context.kAppLocalizations.edit,
                          style: context.kTextTheme.labelLarge!.copyWith(
                            color: AppColors.kSecondColor,
                          ),
                          onTap: () =>
                              context.router.push(OrderLocationRoute()),
                        ),
                      ],
                    ),
                    SizedBox(height: context.height * 0.020),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(AppImages.kIconLocation),
                        Expanded(
                          child: Text(
                            "4517 Washington Ave. Manchester, Kentucky 39495",
                            textAlign: TextAlign.center,
                            style: context.kTextTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: context.kChangeTheme.hintColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.height * 0.020),
              Container(
                padding: EdgeInsets.all(context.height * 0.020),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: context.kChangeTheme.primaryColor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.kAppLocalizations.paymentmethod,
                          style: context.kTextTheme.labelLarge!.copyWith(
                            color: AppColors.kGrey,
                          ),
                        ),
                        CustomPrimaryButton(
                          title: context.kAppLocalizations.edit,
                          style: context.kTextTheme.labelLarge!.copyWith(
                            color: AppColors.kSecondColor,
                          ),
                          onTap: () =>
                              context.router.push(PaymentMethodRoute()),
                        ),
                      ],
                    ),
                    SizedBox(height: context.height * 0.020),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(AppSvgs.kVisa, fit: BoxFit.scaleDown),
                        Text(
                          "2121 6352 8465 ****",
                          style: context.kTextTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: context.kChangeTheme.hintColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
