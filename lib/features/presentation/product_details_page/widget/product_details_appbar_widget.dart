import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/components/custom_icon_button_pop.dart';
import '../../../../core/components/custom_snakbar.dart';
import '../../../../core/utils/constant/app_images.dart';
import '../../../../core/utils/constant/app_svgs.dart';
import '../../../../core/utils/extension/extension.dart';

class ProductDetailsAppbarWidget extends StatelessWidget {
  const ProductDetailsAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        SizedBox(
          height: context.height * 0.045,
          width: context.height * 0.045,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: context.kChangeTheme.primaryColor,
              border: Border.all(color: context.kChangeTheme.primaryColorLight),
            ),
            child: CustomIconButton(
              icon: SvgPicture.asset(
                AppSvgs.kShare,
                fit: BoxFit.scaleDown,
                height: context.height * 0.020,
                width: context.height * 0.020,
              ),
              onPressed: () => errorMessage(
                context,
                message: context.kAppLocalizations.comingsoon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
