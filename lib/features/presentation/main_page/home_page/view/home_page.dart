import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_home_appbar.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/components/custom_product_card_widget.dart';
import '../../../../../core/components/custom_snakbar.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../../../data/models/beverages_model.dart';
import '../../../../data/models/explore_model.dart';
import '../../../../data/models/groceries_model.dart';
import '../widgets/carousel_slider_widget.dart';
import '../widgets/filter_items_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  int count = 1;
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.kPatternBackground),
          ListView(
            padding: EdgeInsetsDirectional.only(
              start: context.height * 0.020,
              end: context.height * 0.020,
              top: context.height * 0.060,
            ),
            children: [
              CustomHomeAppbar(searchController: searchController),
              SizedBox(height: context.height * 0.020),
              CarouselSliderWidget(),
              SizedBox(height: context.height * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPrimaryButton(
                    title: context.kAppLocalizations.beverages,
                    style: context.kTextTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomPrimaryButton(
                    title: context.kAppLocalizations.seeall,
                    style: context.kTextTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.kSecondColor,
                    ),
                    onTap: () => context.router.push(BeveragesRoute()),
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.015),
              SizedBox(
                height: context.height * 0.280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    final data = beveragesItems(context)[index];
                    return CustomProductCardWidget(
                      image: data.image,
                      title: data.title,
                      subTitle: data.subTitle,
                      price: data.price,
                      margin: EdgeInsetsDirectional.only(
                        end: context.height * 0.015,
                      ),
                      onTap: () => successMessage(
                        context,
                        message: context.kAppLocalizations.addedtocart,
                      ),
                      containerOnTap: () => context.router.push(
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
              SizedBox(height: context.height * 0.030),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPrimaryButton(
                    title: context.kAppLocalizations.groceries,
                    style: context.kTextTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomPrimaryButton(
                    title: context.kAppLocalizations.seeall,
                    style: context.kTextTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.kSecondColor,
                    ),
                    onTap: () => context.router.push(GroceriesRoute()),
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.020),
              SizedBox(
                height: context.height * 0.110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exploreModel(context).length,
                  itemBuilder: (context, index) {
                    final data = exploreModel(context)[index];
                    return FilterItem(
                      data: data,
                      onTap: () => context.router.push(
                        ProductDetailsRoute(
                          image: data.image,
                          title: data.title,
                          subTitle: data.subTitle ?? "",
                          price: data.price ?? "",
                          description: data.description ?? "",
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: context.height * 0.020),
              SizedBox(
                height: context.height * 0.280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final data = groceriesModel(context)[index];
                    return CustomProductCardWidget(
                      image: data.image,
                      title: data.title,
                      subTitle: data.subTitle,
                      price: data.price,
                      margin: EdgeInsetsDirectional.only(
                        end: context.height * 0.015,
                      ),
                      containerOnTap: () => context.router.push(
                        ProductDetailsRoute(
                          image: data.image,
                          title: data.title,
                          subTitle: data.subTitle,
                          price: data.price,
                          description: data.description,
                        ),
                      ),
                      onTap: () => successMessage(
                        context,
                        message: context.kAppLocalizations.addedtocart,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
