import 'package:flutter/material.dart';
import 'package:food_ninja/core/utils/extension/extension.dart';
import 'package:food_ninja/core/utils/theme/app_colors.dart';
import 'package:pinput/pinput.dart';

class OtpPinPutWidget extends StatelessWidget {
  final TextEditingController? pinputController;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  const OtpPinPutWidget({
    super.key,
    this.pinputController,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.kAppLocalizations.otpcode,
          style: context.kTextTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: context.height * 0.010),
        Center(
          child: Pinput(
            defaultPinTheme: pinTheme(context, border: AppColors.kBorder),
            focusedPinTheme: pinTheme(
              context,
              border: AppColors.kSecondaryGold,
            ),
            errorPinTheme: pinTheme(context, border: AppColors.kRed),
            keyboardType: TextInputType.number,
            validator: validator,
            onChanged: onChanged,
            autofocus: true,
            controller: pinputController,
            length: 6,
          ),
        ),
      ],
    );
  }

  PinTheme pinTheme(BuildContext context, {required Color border}) => PinTheme(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(context.height * 0.016),
      border: Border.all(color: border, width: context.height * 0.002),
    ),
    height: context.height * 0.060,
    width: context.height * 0.050,
    textStyle: context.kTextTheme.titleMedium!.copyWith(
      fontWeight: FontWeight.w600,
      color: AppColors.kSecondaryGold,
    ),
    margin: EdgeInsets.symmetric(horizontal: context.height * 0.005),
  );
}
