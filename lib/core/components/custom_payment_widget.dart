import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/extension/extension.dart';
import 'custom_text_form_field.dart';

class PaymentsContainer extends StatelessWidget {
  final TextEditingController controller;
  final String payment;
  final Function()? onTap;
  const PaymentsContainer({
    super.key,
    required this.payment,
    this.onTap,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.height * 0.020,
          vertical: context.height * 0.020,
        ),
        decoration: BoxDecoration(
          color: context.kChangeTheme.primaryColor,
          border: Border.all(color: context.kChangeTheme.primaryColorLight),
          borderRadius: BorderRadius.circular(context.height * 0.022),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(payment, fit: BoxFit.scaleDown),
            SizedBox(
              width: context.height * 0.250,
              child: CustomTextFormField(
                keyboardType: TextInputType.number,
                enabledBorderColor: context.kChangeTheme.hintColor,
                focusedBorderColor: context.kChangeTheme.hintColor,
                hintText: "2121 6352 8465 ****",
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
