import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../utils/theme/app_colors.dart';
import '../utils/constant/app_images.dart';
import '../utils/extension/extension.dart';
import 'custom_icon_button_pop.dart';

class CustomAppbarStack extends StatelessWidget {
  final String title;
  const CustomAppbarStack({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
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
        Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            title,
            style: context.kTextTheme.titleLarge!.copyWith(
              color: AppColors.kTitle,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
