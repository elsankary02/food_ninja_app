import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button_pop.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/components/custom_snakbar.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../favourite_page/widget/favourite_dialog_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(context.height * 0.015),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.kPatternBackground),
            ),
            color: context.kChangeTheme.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.height * 0.022),
              topRight: Radius.circular(context.height * 0.022),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.kAppLocalizations.checkout,
                    style: context.kTextTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: context.kChangeTheme.hintColor,
                    ),
                  ),
                  CustomIconButton(
                    icon: Icon(
                      Icons.close,
                      color: context.kChangeTheme.hintColor,
                    ),
                    onPressed: () => context.router.maybePop(),
                  ),
                ],
              ),
              BottomSheetListTileWidget(
                title: context.kAppLocalizations.confirmorder,
                subTitle: context.kAppLocalizations.confirmation,
                onTap: () => context.router.push(ConfirmOrderRoute()),
              ),
              BottomSheetListTileWidget(
                title: context.kAppLocalizations.paymentmethods,
                subTitle: context.kAppLocalizations.selectmethod,
                onTap: () => context.router.push(PaymentMethodRoute()),
              ),
              BottomSheetListTileWidget(
                title: context.kAppLocalizations.total,
                subTitle: r'$113.97',
              ),
              SizedBox(height: context.height * 0.020),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "${context.kAppLocalizations.byplacinganorderyouagreetoour}\n",
                      style: context.kTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.kGrey,
                      ),
                    ),
                    TextSpan(
                      text: context.kAppLocalizations.terms,
                      style: context.kTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.kChangeTheme.hintColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => errorMessage(
                          context,
                          message: context.kAppLocalizations.comingsoon,
                        ),
                    ),
                    TextSpan(
                      text: context.kAppLocalizations.and,
                      style: context.kTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.kGrey,
                      ),
                    ),
                    TextSpan(
                      text: context.kAppLocalizations.conditions,
                      style: context.kTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.kChangeTheme.hintColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => errorMessage(
                          context,
                          message: context.kAppLocalizations.comingsoon,
                        ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.height * 0.020),
              CustomPrimaryButton(
                title: context.kAppLocalizations.placeorder,
                style: context.kTextTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.kWhite,
                ),
                padding: EdgeInsets.symmetric(vertical: context.height * 0.020),
                backGroundColor: AppColors.kSecondColor,
                borderRadius: BorderRadius.circular(context.height * 0.015),
                onTap: () => showDialog(
                  context: context,
                  builder: (context) {
                    return FavouriteDialog(
                      image: AppImages.kOrderAccepted,
                      title: context.kAppLocalizations.yourorderaccepted,
                      subTitle: context.kAppLocalizations.youritemsplaced,
                      buttonTitle: context.kAppLocalizations.trackorder,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BottomSheetListTileWidget extends StatelessWidget {
  final String title, subTitle;
  final void Function()? onTap;
  const BottomSheetListTileWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.kTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: context.kChangeTheme.hintColor,
            ),
          ),
          Text(
            subTitle,
            style: context.kTextTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w600,
              color: context.kChangeTheme.hintColor,
            ),
          ),
        ],
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
