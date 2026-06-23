import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/components/custom_icon_button_pop.dart';
import '../../../../core/components/custom_plus_and_minus.dart';
import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_snakbar.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/constant/app_images.dart';
import '../../../../core/utils/extension/extension.dart';
import '../widget/product_details_appbar_widget.dart';

@RoutePage()
class ProductDetailsPage extends StatefulWidget {
  final String image, title, subTitle, price, description;
  const ProductDetailsPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.description,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isSelected = false;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.kOnboardingPattern),
          ListView(
            padding: EdgeInsetsDirectional.only(
              start: context.height * 0.020,
              end: context.height * 0.020,
              top: context.height * 0.060,
            ),
            children: [
              ProductDetailsAppbarWidget(),
              Image.asset(
                widget.image,
                fit: BoxFit.fitHeight,
                height: context.height * 0.200,
                width: context.height * 0.230,
              ),
              SizedBox(height: context.height * 0.020),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: context.kTextTheme.headlineSmall!.copyWith(
                      color: context.kChangeTheme.hintColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomIconButton(
                    icon: Icon(
                      isSelected ? Icons.favorite : Icons.favorite_border,
                      color: isSelected
                          ? AppColors.kRed
                          : context.kChangeTheme.hintColor,
                    ),
                    onPressed: () {
                      if (isSelected) {
                        successMessage(
                          context,
                          message:
                              context.kAppLocalizations.removedfromfavorites,
                        );
                      } else {
                        successMessage(
                          context,
                          message: context.kAppLocalizations.addedtofavorites,
                        );
                      }
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                  ),
                ],
              ),
              Text(
                widget.subTitle,
                style: context.kTextTheme.bodyLarge!.copyWith(
                  color: AppColors.kGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: context.height * 0.030),
              CustomPlusAndMinus(
                count: count,
                plusOnTap: () {
                  setState(() {
                    count++;
                  });
                },
                minusOnTap: () {
                  if (count > 1) {
                    setState(() {
                      count--;
                    });
                  }
                },
                price: widget.price,
              ),
              SizedBox(height: context.height * 0.020),
              Divider(color: context.kChangeTheme.primaryColorLight),
              SizedBox(height: context.height * 0.020),
              Text(
                context.kAppLocalizations.productdetail,
                style: context.kTextTheme.bodyLarge!.copyWith(
                  color: context.kChangeTheme.hintColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: context.height * 0.010),
              DefaultTextStyle(
                style: context.kTextTheme.labelMedium!.copyWith(
                  color: AppColors.kGrey,
                  fontWeight: FontWeight.w500,
                ),
                child: ReadMoreText(
                  widget.description,
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  lessStyle: context.kTextTheme.labelMedium!.copyWith(
                    color: AppColors.kSecondColor,
                    fontWeight: FontWeight.w500,
                  ),
                  trimCollapsedText: context.kAppLocalizations.showmore,
                  trimExpandedText: context.kAppLocalizations.showless,
                  moreStyle: context.kTextTheme.labelMedium!.copyWith(
                    color: AppColors.kSecondColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: CustomPrimaryButton(
              title: context.kAppLocalizations.addtobasket,
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
                message: context.kAppLocalizations.addedtocart,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
