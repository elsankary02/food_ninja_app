import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button_pop.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/components/custom_snakbar.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/extension/extension.dart';

@RoutePage()
class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool eggs = true;
  bool noodlesAndPasta = false;
  bool chipsAndCrisps = false;
  bool fastFood = false;
  bool individualCallection = true;
  bool cocola = false;
  bool ifad = false;
  bool kaziFarmas = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.kPatternBackground),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: context.height * 0.020,
              end: context.height * 0.020,
              top: context.height * 0.060,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: context.height * 0.010),
                Text(
                  context.kAppLocalizations.filters,
                  style: context.kTextTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.kChangeTheme.hintColor,
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(height: context.height * 0.020),
                      Text(
                        context.kAppLocalizations.categories,
                        style: context.kTextTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.kChangeTheme.hintColor,
                        ),
                      ),
                      CheckBoxListTile(
                        title: context.kAppLocalizations.eggs,
                        value: eggs,
                        onChanged: (value) {
                          setState(() {
                            eggs = value!;
                          });
                        },
                        color: eggs == true
                            ? AppColors.kPrimaryColor
                            : context.kChangeTheme.hintColor,
                      ),
                      CheckBoxListTile(
                        title: context.kAppLocalizations.noodlesandpasta,
                        value: noodlesAndPasta,
                        onChanged: (value) {
                          setState(() {
                            noodlesAndPasta = value!;
                          });
                        },
                        color: noodlesAndPasta == true
                            ? AppColors.kPrimaryColor
                            : context.kChangeTheme.hintColor,
                      ),
                      CheckBoxListTile(
                        title: context.kAppLocalizations.chipsandcrisps,
                        value: chipsAndCrisps,
                        onChanged: (value) {
                          setState(() {
                            chipsAndCrisps = value!;
                          });
                        },
                        color: chipsAndCrisps == true
                            ? AppColors.kPrimaryColor
                            : context.kChangeTheme.hintColor,
                      ),
                      CheckBoxListTile(
                        title: context.kAppLocalizations.fastfood,
                        value: fastFood,
                        onChanged: (value) {
                          setState(() {
                            fastFood = value!;
                          });
                        },
                        color: fastFood == true
                            ? AppColors.kPrimaryColor
                            : context.kChangeTheme.hintColor,
                      ),
                      SizedBox(height: context.height * 0.020),
                      Text(
                        context.kAppLocalizations.brand,
                        style: context.kTextTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.kChangeTheme.hintColor,
                        ),
                      ),
                      CheckBoxListTile(
                        title: context.kAppLocalizations.individualcollection,
                        value: individualCallection,
                        onChanged: (value) {
                          setState(() {
                            individualCallection = value!;
                          });
                        },
                        color: individualCallection == true
                            ? AppColors.kPrimaryColor
                            : context.kChangeTheme.hintColor,
                      ),
                      CheckBoxListTile(
                        title: context.kAppLocalizations.cocola,
                        value: cocola,
                        onChanged: (value) {
                          setState(() {
                            cocola = value!;
                          });
                        },
                        color: cocola == true
                            ? AppColors.kPrimaryColor
                            : context.kChangeTheme.hintColor,
                      ),
                      CheckBoxListTile(
                        title: context.kAppLocalizations.ifad,
                        value: ifad,
                        onChanged: (value) {
                          setState(() {
                            ifad = value!;
                          });
                        },
                        color: ifad == true
                            ? AppColors.kPrimaryColor
                            : context.kChangeTheme.hintColor,
                      ),
                      CheckBoxListTile(
                        title: context.kAppLocalizations.kazifarmas,
                        value: kaziFarmas,
                        onChanged: (value) {
                          setState(() {
                            kaziFarmas = value!;
                          });
                        },
                        color: kaziFarmas == true
                            ? AppColors.kPrimaryColor
                            : context.kChangeTheme.hintColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: CustomPrimaryButton(
              title: context.kAppLocalizations.applyfilter,
              padding: EdgeInsets.symmetric(vertical: context.height * 0.020),
              gradient: LinearGradient(
                colors: [AppColors.kPrimaryColor, AppColors.kSecondColor],
              ),
              style: context.kTextTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.kWhite,
              ),
              borderRadius: BorderRadius.circular(context.height * 0.015),
              onTap: () => errorMessage(
                context,
                message: context.kAppLocalizations.comingsoon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckBoxListTile extends StatelessWidget {
  final bool? value;
  final void Function(bool? value)? onChanged;
  final String title;
  final Color? color;
  const CheckBoxListTile({
    super.key,
    this.value,
    this.onChanged,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: AppColors.kPrimaryColor,
        value: value,
        onChanged: onChanged,
      ),
      title: Text(
        title,
        style: context.kTextTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
