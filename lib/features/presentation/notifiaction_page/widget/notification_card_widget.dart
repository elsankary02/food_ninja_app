import 'package:flutter/material.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/extension/extension.dart';

class NotifiactionCardWidget extends StatelessWidget {
  final String image;
  final String titel;
  final String subTitel;
  const NotifiactionCardWidget({
    super.key,
    required this.image,
    required this.titel,
    required this.subTitel,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.height * 0.010),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.height * 0.022),
        color: AppColors.kWhite,
        border: Border.all(color: AppColors.kBorder),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(image, fit: BoxFit.cover),
        title: Text(
          titel,
          style: context.kTextTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.kTitle,
          ),
        ),

        subtitle: Text(
          subTitel,
          style: context.kTextTheme.titleSmall!.copyWith(
            color: AppColors.kGrey,
          ),
        ),
      ),
    );
  }
}
