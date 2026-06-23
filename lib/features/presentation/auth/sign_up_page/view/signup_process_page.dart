import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ninja/core/components/custom_icon_button_pop.dart';
import 'package:food_ninja/core/components/custom_primary_button.dart';
import 'package:food_ninja/core/components/custom_snakbar.dart';
import 'package:food_ninja/core/components/custom_text_form_field.dart';
import 'package:food_ninja/core/router/router.dart';
import 'package:food_ninja/core/utils/constant/app_images.dart';
import 'package:food_ninja/core/utils/constant/app_svgs.dart';
import 'package:food_ninja/core/utils/extension/extension.dart';
import 'package:food_ninja/core/utils/theme/app_colors.dart';
import 'package:food_ninja/features/data/providers/auth/post/complete_profile_provider.dart';
import 'package:image_picker/image_picker.dart';

import '../widget/upload_photo_widget.dart';

@RoutePage()
class SignupProcessPage extends ConsumerStatefulWidget {
  const SignupProcessPage({super.key});

  @override
  ConsumerState<SignupProcessPage> createState() => _SignupProcessPageState();
}

class _SignupProcessPageState extends ConsumerState<SignupProcessPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final fullNameController = TextEditingController();
  File? file;
  @override
  void dispose() {
    usernameController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  Future<void> fromGallery() async {
    final picker = ImagePicker();
    final gallery = await picker.pickImage(source: ImageSource.gallery);
    if (gallery == null) return;
    setState(() {
      file = File(gallery.path);
    });
  }

  Future<void> fromCamera() async {
    final picker = ImagePicker();
    final camera = await picker.pickImage(source: ImageSource.camera);
    if (camera == null) return;
    setState(() {
      file = File(camera.path);
    });
  }

  Future<void> completeProfile() async {
    if (!formKey.currentState!.validate()) return;
    if (file == null) {
      errorMessage(
        context,
        message: context.kAppLocalizations.pleaseselectaprofileimage,
      );
      return;
    }
    final notifier = ref.read(completeProfileProvider.notifier);
    await notifier.completeProfile(
      name: fullNameController.text.trim(),
      username: usernameController.text.trim(),
      file: file,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(completeProfileProvider);
    ref.listen(completeProfileProvider, (_, state) {
      if (state is CompleteProfileFailure) {
        errorMessage(context, message: state.errMessage);
        return;
      }
      if (state is CompleteProfileSuccess) {
        successMessage(
          context,
          message: context.kAppLocalizations.profilecompletedsuccessfully,
        );
        context.router.replace(MainRoute());
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.kPatternBackground),
          Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsetsDirectional.only(
                start: context.height * 0.020,
                end: context.height * 0.020,
                top: context.height * 0.050,
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
                  context.kAppLocalizations.fillinyourbiotogetstarted,
                  style: context.kTextTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.kChangeTheme.hintColor,
                  ),
                ),
                SizedBox(height: context.height * 0.019),
                Text(
                  context
                      .kAppLocalizations
                      .thisdatawillbedisplayedyouraccountprofileforsecurity,
                  style: context.kTextTheme.labelMedium!.copyWith(
                    color: context.kChangeTheme.hintColor,
                  ),
                ),
                SizedBox(height: context.height * 0.020),
                UnconstrainedBox(
                  child: ClipOval(
                    child: file == null
                        ? Image.asset(
                            AppImages.kMintDark,
                            width: context.height * 0.140,
                            height: context.height * 0.140,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            file!,
                            width: context.height * 0.140,
                            height: context.height * 0.140,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(height: context.height * 0.020),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UploadPhotoWidget(
                      image: AppSvgs.kGallery,
                      onTap: () => fromGallery(),
                    ),
                    UploadPhotoWidget(
                      image: AppSvgs.kCamera,
                      onTap: () => fromCamera(),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.020),
                CustomTextFormField(
                  hintText: context.kAppLocalizations.username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.kAppLocalizations.usernameisrequired;
                    } else if (value.length < 3) {
                      return context
                          .kAppLocalizations
                          .usernamemustbeatleast3chars;
                    }
                    return null;
                  },
                  prefixIcon: Icon(Icons.alternate_email),
                  cursorColor: AppColors.kGrey,
                  hintStyle: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: context.kChangeTheme.primaryColor,
                  enabledBorderColor: context.kChangeTheme.primaryColorLight,
                  focusedBorderColor: context.kChangeTheme.primaryColorLight,
                  controller: usernameController,
                ),
                SizedBox(height: context.height * 0.020),
                CustomTextFormField(
                  hintText: context.kAppLocalizations.fullname,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.kAppLocalizations.fullnameisrequired;
                    } else if (value.length < 3) {
                      return context
                          .kAppLocalizations
                          .fullnamemustbeatleast3chars;
                    }
                    return null;
                  },
                  prefixIcon: SvgPicture.asset(
                    AppSvgs.kProfile,
                    fit: BoxFit.scaleDown,
                  ),
                  cursorColor: AppColors.kGrey,
                  hintStyle: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: context.kChangeTheme.primaryColor,
                  enabledBorderColor: context.kChangeTheme.primaryColorLight,
                  focusedBorderColor: context.kChangeTheme.primaryColorLight,
                  controller: fullNameController,
                ),
                SizedBox(height: context.height * 0.040),
                UnconstrainedBox(
                  child: CustomPrimaryButton(
                    title: context.kAppLocalizations.next,
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
                    onTap: () => completeProfile(),
                    isLoading: state is CompleteProfileLoading,
                  ),
                ),
                SizedBox(height: context.height * 0.050),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
