import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button_pop.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/extension/extension.dart';

class ProfileImagePickerWidget extends StatelessWidget {
  final Widget? image;
  final void Function()? onPressed;
  const ProfileImagePickerWidget({
    super.key,
    required this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipOval(
            child: SizedBox(
              width: context.height * 0.180,
              height: context.height * 0.180,
              child: image,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.kPrimaryColor, AppColors.kSecondColor],
              ),
              borderRadius: BorderRadius.circular(context.height * 0.030),
            ),
            child: CustomIconButton(
              icon: Icon(
                Icons.camera_alt,
                color: AppColors.kWhite,
                size: context.height * 0.035,
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
