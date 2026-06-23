import 'package:flutter/material.dart';

import '../utils/theme/app_colors.dart';
import '../utils/extension/extension.dart';

class CustomIconAdd extends StatelessWidget {
  final void Function()? onTap;
  const CustomIconAdd({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.height * 0.015),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kPrimaryColor, AppColors.kSecondColor],
          ),

          borderRadius: BorderRadius.circular(context.height * 0.017),
        ),
        child: Icon(
          Icons.add,
          color: AppColors.kWhite,
          size: context.height * 0.020,
        ),
      ),
    );
  }
}
