import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button_pop.dart';
import '../../../../../core/components/custom_payment_widget.dart';
import '../../../../../core/components/custom_snakbar.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/constant/app_svgs.dart';
import '../../../../../core/utils/extension/extension.dart';

@RoutePage()
class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  final paypalController = TextEditingController();
  final visaController = TextEditingController();
  final payyoneerController = TextEditingController();
  @override
  void dispose() {
    paypalController.dispose();
    visaController.dispose();
    payyoneerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.kPatternBackground, fit: BoxFit.cover),
          ListView(
            padding: EdgeInsetsDirectional.only(
              start: context.height * 0.020,
              end: context.height * 0.020,
              top: context.height * 0.060,
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                ],
              ),
              SizedBox(height: context.height * 0.020),
              Text(
                context.kAppLocalizations.paymentmethods,
                style: context.kTextTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.kChangeTheme.hintColor,
                ),
              ),
              SizedBox(height: context.height * 0.040),
              PaymentsContainer(
                payment: AppSvgs.kPaypal,
                onTap: () => errorMessage(
                  context,
                  message: context.kAppLocalizations.comingsoon,
                ),
                controller: paypalController,
              ),
              SizedBox(height: context.height * 0.020),
              PaymentsContainer(
                payment: AppSvgs.kVisa,
                onTap: () => errorMessage(
                  context,
                  message: context.kAppLocalizations.comingsoon,
                ),
                controller: visaController,
              ),
              SizedBox(height: context.height * 0.020),
              PaymentsContainer(
                payment: AppSvgs.kPayoneer,
                onTap: () => errorMessage(
                  context,
                  message: context.kAppLocalizations.comingsoon,
                ),
                controller: payyoneerController,
              ),
              SizedBox(height: context.height * 0.190),
            ],
          ),
        ],
      ),
    );
  }
}
