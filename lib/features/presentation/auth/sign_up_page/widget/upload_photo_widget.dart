import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/utils/extension/extension.dart';

class UploadPhotoWidget extends StatelessWidget {
  final String image;
  final void Function()? onTap;
  const UploadPhotoWidget({super.key, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.height * 0.040,
          vertical: context.height * 0.016,
        ),
        decoration: BoxDecoration(
          color: context.kChangeTheme.primaryColor,
          borderRadius: BorderRadius.circular(context.height * 0.022),
          border: Border.all(color: context.kChangeTheme.primaryColorLight),
        ),
        child: SvgPicture.asset(
          image,
          height: context.height * 0.045,
          width: context.height * 0.045,
        ),
      ),
    );
  }
}
