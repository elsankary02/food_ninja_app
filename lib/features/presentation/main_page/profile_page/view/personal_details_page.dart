import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/components/custom_icon_button_pop.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/components/custom_snakbar.dart';
import '../../../../../core/components/custom_text_form_field.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/constant/app_svgs.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../data/providers/auth/get/get_user_provider.dart';
import '../../../../data/providers/auth/post/complete_profile_provider.dart';
import '../widget/profile_image_picker.dart';

@RoutePage()
class PersonalDetailsPage extends ConsumerStatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  ConsumerState<PersonalDetailsPage> createState() =>
      _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends ConsumerState<PersonalDetailsPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  File? file;

  @override
  void initState() {
    userData();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void userData() {
    final notifier = ref.read(getUserProvider.notifier).userModel;
    if (notifier == null) return;
    usernameController.text = notifier.username ?? "";
    nameController.text = notifier.name ?? "";
    emailController.text = notifier.email ?? "";
    file = null;
  }

  Future<void> gallery() async {
    final gallery = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (gallery == null) return;
    setState(() {
      file = File(gallery.path);
    });
  }

  Future<void> camera() async {
    final camera = await ImagePicker().pickImage(source: ImageSource.camera);
    if (camera == null) return;
    setState(() {
      file = File(camera.path);
    });
  }

  Future<void> completeProfile() async {
    if (!formKey.currentState!.validate()) return;
    final notifier = ref.read(completeProfileProvider.notifier);
    await notifier.completeProfile(
      name: nameController.text,
      username: usernameController.text,
      email: emailController.text,
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
        ref.read(getUserProvider.notifier).getUser();
        successMessage(
          context,
          message: context.kAppLocalizations.profilecompletedsuccessfully,
        );
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
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: CustomIconButton(
                    icon: Image.asset(
                      AppImages.kIconBack,
                      fit: BoxFit.scaleDown,
                      height: context.height * 0.045,
                      width: context.height * 0.045,
                    ),
                    onPressed: () => context.router.maybePop(),
                  ),
                ),
                SizedBox(height: context.height * 0.010),
                Text(
                  context.kAppLocalizations.personaldetails,
                  style: context.kTextTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.kChangeTheme.hintColor,
                  ),
                ),
                SizedBox(height: context.height * 0.020),
                ProfileImagePickerWidget(
                  image: file == null
                      ? Image.asset(AppImages.kMintDark, fit: BoxFit.cover)
                      : Image.file(file!, fit: BoxFit.cover),
                  onPressed: () => gallery(),
                ),
                SizedBox(height: context.height * 0.040),

                CustomTextFormField(
                  hintText: context.kAppLocalizations.fullname,
                  prefixIcon: SvgPicture.asset(
                    AppSvgs.kProfile,
                    fit: BoxFit.scaleDown,
                  ),
                  cursorColor: AppColors.kGrey,
                  hintStyle: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: context.kChangeTheme.primaryColor,
                  enabledBorderColor: context.kChangeTheme.primaryColorLight,
                  focusedBorderColor: context.kChangeTheme.primaryColorLight,
                  controller: nameController,
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
                ),
                SizedBox(height: context.height * 0.020),
                CustomTextFormField(
                  hintText: context.kAppLocalizations.username,
                  prefixIcon: Icon(Icons.alternate_email),
                  cursorColor: AppColors.kGrey,
                  hintStyle: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: context.kChangeTheme.primaryColor,
                  enabledBorderColor: context.kChangeTheme.primaryColorLight,
                  focusedBorderColor: context.kChangeTheme.primaryColorLight,
                  controller: usernameController,
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
                ),
                SizedBox(height: context.height * 0.020),
                CustomTextFormField(
                  hintText: context.kAppLocalizations.email,
                  prefixIcon: SvgPicture.asset(
                    AppSvgs.kMessage,
                    fit: BoxFit.scaleDown,
                  ),
                  cursorColor: AppColors.kGrey,
                  hintStyle: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: context.kChangeTheme.primaryColor,
                  enabledBorderColor: context.kChangeTheme.primaryColorLight,
                  focusedBorderColor: context.kChangeTheme.primaryColorLight,
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return context.kAppLocalizations.pleaseenteravalidemail;
                    } else if (!value.contains('@gmail.com')) {
                      return context.kAppLocalizations.emailmustcontainat;
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.height * 0.060),
                CustomPrimaryButton(
                  title: context.kAppLocalizations.save,
                  style: context.kTextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.kWhite,
                  ),
                  borderRadius: BorderRadius.circular(context.height * 0.020),
                  gradient: LinearGradient(
                    colors: [AppColors.kPrimaryColor, AppColors.kSecondColor],
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: context.height * 0.015,
                  ),
                  isLoading: state is CompleteProfileLoading,
                  onTap: () => completeProfile(),
                ),
                SizedBox(height: context.height * 0.060),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
