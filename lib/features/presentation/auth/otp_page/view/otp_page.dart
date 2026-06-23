import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ninja/core/components/custom_icon_button_pop.dart';
import 'package:food_ninja/core/components/custom_primary_button.dart';
import 'package:food_ninja/core/components/custom_snakbar.dart';
import 'package:food_ninja/core/router/router.dart';
import 'package:food_ninja/core/utils/constant/app_enums.dart';
import 'package:food_ninja/core/utils/constant/app_images.dart';
import 'package:food_ninja/core/utils/extension/extension.dart';
import 'package:food_ninja/core/utils/theme/app_colors.dart';
import 'package:food_ninja/features/data/providers/auth/post/resend_otp_provider.dart';
import 'package:food_ninja/features/data/providers/auth/post/verify_otp_provider.dart';

import '../widget/otp_pin_put_widget.dart';

@RoutePage()
class OtpPage extends ConsumerStatefulWidget {
  final bool isLogin;
  final TextEditingController phoneController, emailController;
  final ContentTybe contentTybe;
  const OtpPage({
    super.key,
    required this.isLogin,
    required this.contentTybe,
    required this.phoneController,
    required this.emailController,
  });

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  final formKey = GlobalKey<FormState>();
  final pinputController = TextEditingController();
  Timer? resendOTP;
  int time = 60;

  startTimer() {
    time = 60;
    resendOTP?.cancel();
    resendOTP = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        setState(() {
          time--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    resendOTP?.cancel();
    pinputController.dispose();
    super.dispose();
  }

  Future<void> verifyOtp() async {
    if (!formKey.currentState!.validate()) return;
    final notifier = ref.read(verifyOtpProvider.notifier);
    final isEmail = widget.contentTybe == ContentTybe.email;
    await notifier.verifyOtp(
      authMethod: widget.contentTybe.name,
      otp: pinputController.text.trim(),
      email: isEmail ? widget.emailController.text.trim() : null,
      phone: isEmail ? null : widget.phoneController.text.trim(),
      phonePrefix: isEmail ? null : "+20",
    );
  }

  Future<void> resendOtp() async {
    final notifier = ref.read(resendOtpProvider.notifier);
    final isEmail = widget.contentTybe == ContentTybe.email;
    await notifier.resendOtp(
      authMethod: widget.contentTybe.name,
      email: isEmail ? widget.emailController.text.trim() : null,
      phone: isEmail ? null : widget.phoneController.text.trim(),
      phonePrefix: isEmail ? null : "+20",
    );
    successMessage(
      context,
      message: context.kAppLocalizations.otpresentsuccessfully,
    );
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(verifyOtpProvider);
    ref.listen(verifyOtpProvider, (_, state) {
      if (state is VerifyOtpFailure) {
        errorMessage(context, message: state.errMessage);
        return;
      }
      if (state is VerifyOtpSuccess) {
        final isLogin = widget.isLogin;
        if (isLogin == false) {
          context.router.replace(MainRoute());
          successMessage(
            context,
            message: context.kAppLocalizations.welcomebackloginsuccess,
          );
          return;
        } else {
          context.router.replace(SignupProcessRoute());
          successMessage(
            context,
            message: context.kAppLocalizations.authenticationsuccessful,
          );
        }
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.kPatternBackground, fit: BoxFit.cover),
          Form(
            key: formKey,
            child: ListView(
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
                  context.kAppLocalizations.enter6digitverifycode,
                  style: context.kTextTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.kChangeTheme.hintColor,
                  ),
                ),
                SizedBox(height: context.height * 0.020),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: context
                            .kAppLocalizations
                            .entertheotpcodesenttoyouremail,
                        style: context.kTextTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.kGrey,
                        ),
                      ),
                      TextSpan(
                        text:
                            "\n${widget.contentTybe == ContentTybe.email ? widget.emailController.text.trim() : widget.phoneController.text.trim()}",
                        style: context.kTextTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.kSecondaryGold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.height * 0.040),
                OtpPinPutWidget(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return context.kAppLocalizations.pleaseentertheotp;
                    } else if (value.length < 6) {
                      return context.kAppLocalizations.otpmustbe6digits;
                    }
                    return null;
                  },
                  pinputController: pinputController,
                ),
                SizedBox(height: context.height * 0.180),
                time > 0
                    ? Text(
                        textAlign: TextAlign.center,
                        "${context.kAppLocalizations.resendOtpPrefix}$time",
                        style: context.kTextTheme.labelLarge!.copyWith(
                          color: AppColors.kGrey,
                        ),
                      )
                    : UnconstrainedBox(
                        child: CustomPrimaryButton(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.height * 0.010,
                            vertical: context.height * 0.010,
                          ),
                          borderRadius: BorderRadius.circular(
                            context.height * 0.016,
                          ),
                          border: Border.all(color: AppColors.kBorder),
                          title: context.kAppLocalizations.resendotp,
                          style: context.kTextTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.kSecondaryGold,
                          ),
                          onTap: () => resendOtp(),
                        ),
                      ),
                SizedBox(height: context.height * 0.020),
                UnconstrainedBox(
                  child: CustomPrimaryButton(
                    title: context.kAppLocalizations.verify,
                    style: context.kTextTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.height * 0.060,
                      vertical: context.height * 0.018,
                    ),
                    gradient: const LinearGradient(
                      begin: AlignmentGeometry.topLeft,
                      end: AlignmentGeometry.bottomRight,
                      colors: [AppColors.kPrimaryColor, AppColors.kSecondColor],
                    ),
                    borderRadius: BorderRadius.circular(context.height * 0.015),
                    isLoading: state is VerifyOtpLoading,
                    onTap: verifyOtp,
                  ),
                ),
                SizedBox(height: context.height * 0.020),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
