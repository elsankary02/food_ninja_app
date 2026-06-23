import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button_pop.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../../core/router/router.dart';

class ChatAppBarWidget extends StatelessWidget {
  const ChatAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: context.height * 0.015),
        decoration: BoxDecoration(
          color: context.kChangeTheme.primaryColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: context.kChangeTheme.primaryColorLight),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(context.height * 0.090),
            child: Image.asset(
              AppImages.kDefultPhoto,
              height: context.height * 0.045,
              width: context.height * 0.045,
            ),
          ),
          title: Text(
            "Mohamed Ibrahim",
            style: context.kTextTheme.titleSmall!.copyWith(
              color: context.kChangeTheme.hintColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            context.kAppLocalizations.online,
            style: context.kTextTheme.labelMedium!.copyWith(
              color: AppColors.kGrey,
            ),
          ),
          trailing: CustomIconButton(
            icon: Image.asset(
              AppImages.kCallLogo,
              height: context.height * 0.045,
              width: context.height * 0.045,
              fit: BoxFit.scaleDown,
            ),
            onPressed: () => context.router.push(CallRangingRoute()),
          ),
        ),
      ),
    );
  }
}
