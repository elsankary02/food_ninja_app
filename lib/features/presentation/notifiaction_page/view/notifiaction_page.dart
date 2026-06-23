import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_icon_button_pop.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/constant/app_images.dart';
import '../../../../core/utils/extension/extension.dart';

@RoutePage()
class NotifiactionPage extends StatelessWidget {
  const NotifiactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.kPatternBackground),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: context.height * 0.020,
              end: context.height * 0.020,
              top: context.height * 0.060,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: context.height * 0.010),
                Text(
                  context.kAppLocalizations.notification,
                  style: context.kTextTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.kChangeTheme.hintColor,
                  ),
                ),
                SizedBox(height: context.height * 0.020),
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        context.kAppLocalizations.nonotification,
                        textAlign: TextAlign.center,
                        style: context.kTextTheme.titleMedium!.copyWith(
                          color: AppColors.kGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
