import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/extension/extension.dart';

class ListTileItems extends StatelessWidget {
  final FaIconData? icon;
  final IconData? trailingIcon;
  final TextAlign? textAlign;
  final String title;
  final Color? iconColor, titleColor, backgroungColor;
  final void Function()? onTap;
  const ListTileItems({
    super.key,

    required this.title,
    this.iconColor,
    this.titleColor,
    this.onTap,
    this.textAlign,
    this.backgroungColor,
    this.icon,
     this.trailingIcon, required leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: context.height * 0.010,
      ),
      margin: EdgeInsetsDirectional.only(bottom: context.height * 0.008),
      decoration: BoxDecoration(
        color: backgroungColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.kChangeTheme.primaryColorLight),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: FaIcon(icon, color: iconColor),
        title: Text(
          title,
          textAlign: textAlign,
          style: context.kTextTheme.titleMedium!.copyWith(
            color: titleColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(trailingIcon, color: iconColor, size: 20),
      ),
    );
  }
}
