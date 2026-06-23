import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button_pop.dart';
import '../../../../../core/utils/extension/extension.dart';

class VolumeToggleButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final Color? color;
  final Widget icon;

  const VolumeToggleButtonWidget({
    super.key,
    this.onPressed,
    this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(context.height * 0.080),
      ),
      child: Center(
        child: CustomIconButton(icon: icon, onPressed: onPressed),
      ),
    );
  }
}
