import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/components/custom_icon_button_pop.dart';
import 'package:food_ninja/core/components/custom_primary_button.dart';
import 'package:food_ninja/core/components/custom_snakbar.dart';
import 'package:food_ninja/core/components/custom_text_form_field.dart';
import 'package:food_ninja/core/router/router.dart';
import 'package:food_ninja/core/utils/constant/app_enums.dart';
import 'package:food_ninja/core/utils/constant/app_images.dart';
import 'package:food_ninja/core/utils/constant/app_strings.dart' as AppSvgs;
import 'package:food_ninja/core/utils/extension/extension.dart';
import 'package:food_ninja/core/utils/theme/app_colors.dart';
import 'package:food_ninja/features/data/providers/auth/post/register_new_user_provider.dart';
import 'package:food_ninja/features/presentation/main_page/profile_page/widget/language_widget.dart';

@RoutePage()
class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  bool isPassword = false;
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  ContentTybe contentTybe = ContentTybe.email;

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> registerNewUser() async {
    if (!formKey.currentState!.validate()) return;
    final notifier = ref.read(registerNewUserProvider.notifier);
    final isEmail = contentTybe == ContentTybe.email;
    await notifier.registerNewUser(
      authMethod: contentTybe.name,
      phonePrefix: isEmail ? null : "+20",
      email: isEmail ? emailController.text.trim() : null,
      phone: isEmail ? null : phoneController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerNewUserProvider);
    ref.listen(registerNewUserProvider, (_, state) {
      if (state is RegisterNewUserFailure) {
        errorMessage(context, message: state.errMessage);
        return;
      }
      if (state is RegisterNewUserSuccess) {
        successMessage(
          context,
          message: context.kAppLocalizations.userregisteredsuccessfully,
        );
        context.router.replace(
          OtpRoute(
            isLogin: true,
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
                          context.kAppLocalizations.signupforfree,
                          style: context.kTextTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: context.height * 0.040),
                        CustomTextFormField(
                          hintText: context.kAppLocalizations.email,
                          filled: true,
                          fillColor: context.kChangeTheme.primaryColor,
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
                          prefixIcon: SvgPicture.asset(
                            AppSvgs.kMessage,
                            fit: BoxFit.scaleDown,
                          ),
                          cursorColor: AppColors.kGrey,
                          hintStyle: context.kTextTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          enabledBorderColor:
                              context.kChangeTheme.primaryColorLight,
                          focusedBorderColor:
                              context.kChangeTheme.primaryColorLight,
                          controller: emailController,
                        ),
                        SizedBox(height: context.height * 0.040),
                        UnconstrainedBox(
                          child: CustomPrimaryButton(
                            title: context.kAppLocalizations.createaccount,
                            style: context.kTextTheme.titleMedium!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: context.height * 0.026,
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
                            isLoading: state is RegisterNewUserLoading,
                            onTap: registerNewUser,
                          ),
                        ),
                        SizedBox(height: context.height * 0.020),
                        CustomPrimaryButton(
                          title: context
                              .kAppLocalizations
                              .alreadyhaveanaccountlogin,
                          style: context.kTextTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.kPrimaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.kPrimaryColor,
                            decorationThickness: 1,
                          ),
                          onTap: () => context.router.replace(LoginRoute()),
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
