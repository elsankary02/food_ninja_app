import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/components/custom_icon_button_pop.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/components/custom_snakbar.dart';
import '../../../../../core/components/custom_text_form_field.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/constant/app_enums.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/constant/app_svgs.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../../../data/providers/auth/post/resend_otp_provider.dart';
import '../../../main_page/profile_page/widget/language_widget.dart';
import '../widget/social_connection_widget.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  ContentTybe contentTybe = ContentTybe.email;
  bool isPassword = false;

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> resendOtp() async {
    if (!formKey.currentState!.validate()) return;
    final notifier = ref.read(resendOtpProvider.notifier);
    final isEmail = contentTybe == ContentTybe.email;
    await notifier.resendOtp(
      authMethod: contentTybe.name,
      email: isEmail ? emailController.text.trim() : null,
      phone: isEmail ? null : phoneController.text.trim(),
      phonePrefix: isEmail ? null : "+20",
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resendOtpProvider);
    ref.listen(resendOtpProvider, (_, state) {
      if (state is ResendOtpFailure) {
        errorMessage(context, message: state.errMessage);
        return;
      }
      if (state is ResendOtpSuccess) {
        successMessage(
          context,
          message: context.kAppLocalizations.otpresentsuccessfully,
        );
        context.router.replace(
          OtpRoute(
            isLogin: false,
            contentTybe: contentTybe,
            phoneController: phoneController,
            emailController: emailController,
          ),
        );
      }
    });
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                Image.asset(
                  fit: BoxFit.cover,
                  AppImages.kOnboardingPattern,
                  width: double.infinity,
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: CustomIconButton(
                    icon: Icon(Icons.language, color: AppColors.kPrimaryColor),
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return LanguageWidget();
                      },
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(context.height * 0.020),
                    child: Column(
                      children: [
                        SizedBox(height: context.height * 0.047),
                        Image.asset(AppImages.kLogo),
                        Text(
                          textAlign: TextAlign.center,
                          "FoodNinja",
                          style: context.kTextTheme.displayLarge!.copyWith(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          context.kAppLocalizations.delieverfavoritefood,
                          style: context.kTextTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.kChangeTheme.hintColor,
                          ),
                        ),
                        SizedBox(height: context.height * 0.060),
                        Text(
                          textAlign: TextAlign.center,
                          context.kAppLocalizations.logintoyouraccount,
                          style: context.kTextTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: context.height * 0.040),
                        CustomTextFormField(
                          hintText: context.kAppLocalizations.email,
                          prefixIcon: SvgPicture.asset(
                            AppSvgs.kMessage,
                            fit: BoxFit.scaleDown,
                          ),
                          filled: true,
                          fillColor: context.kChangeTheme.primaryColor,
                          cursorColor: AppColors.kGrey,
                          hintStyle: context.kTextTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return context
                                  .kAppLocalizations
                                  .pleaseenteravalidemail;
                            } else if (!value.contains('@gmail.com')) {
                              return context
                                  .kAppLocalizations
                                  .emailmustcontainat;
                            }
                            return null;
                          },
                          enabledBorderColor:
                              context.kChangeTheme.primaryColorLight,
                          focusedBorderColor:
                              context.kChangeTheme.primaryColorLight,
                          controller: emailController,
                        ),
                        SizedBox(height: context.height * 0.020),
                        Text(
                          textAlign: TextAlign.center,
                          context.kAppLocalizations.orcontinuewith,
                          style: context.kTextTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: context.height * 0.020),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialConnectionWidget(
                              onTap: () => errorMessage(
                                context,
                                message: context.kAppLocalizations.comingsoon,
                              ),
                              titleSocial: context.kAppLocalizations.facebook,
                              imageSocial: AppSvgs.kFacebook,
                            ),
                            SizedBox(width: context.height * 0.021),
                            SocialConnectionWidget(
                              onTap: () => errorMessage(
                                context,
                                message: context.kAppLocalizations.comingsoon,
                              ),
                              titleSocial: context.kAppLocalizations.google,
                              imageSocial: AppSvgs.kGoogle,
                            ),
                          ],
                        ),
                        SizedBox(height: context.height * 0.020),
                        UnconstrainedBox(
                          child: CustomPrimaryButton(
                            title: context.kAppLocalizations.login,
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
                              colors: [
                                AppColors.kPrimaryColor,
                                AppColors.kSecondColor,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(
                              context.height * 0.015,
                            ),
                            onTap: () => resendOtp(),
                            isLoading: state is ResendOtpLoading,
                          ),
                        ),
                        SizedBox(height: context.height * 0.020),
                        CustomPrimaryButton(
                          title:
                              context.kAppLocalizations.donthaveanaccountsignup,
                          style: context.kTextTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.kPrimaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.kPrimaryColor,
                            decorationThickness: 1,
                          ),
                          onTap: () => context.router.replace(SignUpRoute()),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
