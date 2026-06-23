import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/utils/extension/extension.dart';

class DialogWidget extends StatelessWidget {
  final String title, content, confirmTitle, cancelTitle;
  final Color? color;
  final void Function()? confirmOnTap;
  const DialogWidget({
    super.key,
    required this.title,
    required this.content,
    required this.confirmTitle,
    required this.cancelTitle,
    this.confirmOnTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.kChangeTheme.scaffoldBackgroundColor,
      title: Text(
        title,
        style: context.kTextTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: context.kChangeTheme.hintColor,
        ),
      ),
      content: Text(
        content,
        style: context.kTextTheme.bodyMedium!.copyWith(
          color: context.kChangeTheme.hintColor,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomPrimaryButton(
              title: confirmTitle,
              style: context.kTextTheme.titleMedium!.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: context.height * 0.020,
                vertical: context.height * 0.008,
              ),
              borderRadius: BorderRadius.circular(16),
              backGroundColor: context.kChangeTheme.primaryColor,
              border: Border.all(color: context.kChangeTheme.primaryColorLight),
              onTap: confirmOnTap,
            ),
            CustomPrimaryButton(
              title: cancelTitle,
              style: context.kTextTheme.titleMedium!.copyWith(
                color: context.kChangeTheme.hintColor,
                fontWeight: FontWeight.w600,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: context.height * 0.020,
                vertical: context.height * 0.008,
              ),
              borderRadius: BorderRadius.circular(16),
              backGroundColor: context.kChangeTheme.primaryColor,
              border: Border.all(color: context.kChangeTheme.primaryColorLight),
              onTap: () => context.router.maybePop(),
            ),
          ],
        ),
      ],
    );
  }
}
