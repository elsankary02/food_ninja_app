import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/components/custom_snakbar.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../../../data/models/beverages_model.dart';
import '../widget/favourite_details_widget.dart';

@RoutePage()
class FavouritePage extends ConsumerStatefulWidget {
  const FavouritePage({super.key});

  @override
  ConsumerState<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends ConsumerState<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.kPatternBackground, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: context.height * 0.020,
              end: context.height * 0.020,
              top: context.height * 0.060,
            ),
            child: Column(
              children: [
                CustomPrimaryButton(
                  title: context.kAppLocalizations.favourite,
                  padding: EdgeInsetsDirectional.only(
                    bottom: context.height * 0.025,
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: context.kChangeTheme.primaryColorLight,
                      width: 2,
                    ),
                  ),
                  style: context.kTextTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.kChangeTheme.hintColor,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsetsDirectional.only(
                      top: context.height * 0.0,
                      bottom: context.height * 0.080,
                    ),
                    itemCount: beveragesItems(context).length,
                    itemBuilder: (context, index) {
                      final data = beveragesItems(context)[index];
                      return FavouriteDetailsWidget(
                        image: data.image,
                        title: data.title,
                        subtitle: data.subTitle,
                        price: data.price,
                        onTap: () => context.router.push(
                          ProductDetailsRoute(
                            image: data.image,
                            title: data.title,
                            subTitle: data.subTitle,
                            price: data.price,
                            description: data.description,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 0,
            child: CustomPrimaryButton(
              title: context.kAppLocalizations.addalltocart,
              style: context.kTextTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.kWhite,
              ),
              padding: EdgeInsets.symmetric(vertical: context.height * 0.020),
              gradient: LinearGradient(
                colors: [AppColors.kPrimaryColor, AppColors.kSecondColor],
              ),
              borderRadius: BorderRadius.circular(context.height * 0.015),
              onTap: () => successMessage(
                context,
                message: context.kAppLocalizations.yourorderaccepted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
