import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/components/custom_snakbar.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../data/models/groceries_model.dart';
import '../widgets/bottom_sheet_widget.dart';
import '../widgets/cart_details_widget.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                  title: context.kAppLocalizations.mycart,
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
                    itemCount: groceriesModel(context).length,
                    itemBuilder: (context, index) {
                      final data = groceriesModel(context)[index];
                      return CartDetailsWidget(
                        onPressed: () => errorMessage(
                          context,
                          message: context.kAppLocalizations.comingsoon,
                        ),
                        image: data.image,
                        title: data.title,
                        subtitle: data.subTitle,
                        price: data.price,
                        count: data.count,
                        plusOnTap: () {
                          setState(() {
                            data.count++;
                          });
                        },
                        minusOnTap: () {
                          if (data.count > 1) {
                            setState(() {
                              data.count--;
                            });
                          }
                        },
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
              title: context.kAppLocalizations.gotocheckout,
              padding: EdgeInsets.symmetric(vertical: context.height * 0.020),
              gradient: LinearGradient(
                colors: [AppColors.kPrimaryColor, AppColors.kSecondColor],
              ),
              style: context.kTextTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.kWhite,
              ),
              borderRadius: BorderRadius.circular(context.height * 0.015),
              onTap: () => showModalBottomSheet(
                isDismissible: false,
                context: context,
                builder: (context) {
                  return BottomSheetWidget();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
