import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_home_appbar.dart';
import '../../../../../core/components/custom_product_card_widget.dart';
import '../../../../../core/components/custom_snakbar.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../../../data/models/beverages_model.dart';

@RoutePage()
class BeveragesPage extends StatefulWidget {
  const BeveragesPage({super.key});

  @override
  State<BeveragesPage> createState() => _BeveragesPageState();
}

class _BeveragesPageState extends State<BeveragesPage> {
  final searchController = TextEditingController();
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
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: context.height * 0.020,
              end: context.height * 0.020,
              top: context.height * 0.060,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHomeAppbar(searchController: searchController),
                SizedBox(height: context.height * 0.020),
                Text(
                  context.kAppLocalizations.beverages,
                  style: context.kTextTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.kChangeTheme.hintColor,
                  ),
                ),
                SizedBox(height: context.height * 0.010),
                Expanded(
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: beveragesItems(context).length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: context.height * 0.280,
                      mainAxisSpacing: context.height * 0.015,
                      crossAxisSpacing: context.height * 0.015,
                    ),
                    itemBuilder: (context, index) {
                      final data = beveragesItems(context)[index];
                      return CustomProductCardWidget(
                        image: data.image,
                        title: data.title,
                        subTitle: data.subTitle,
                        price: data.price,
                        containerOnTap: () => context.router.push(
                          ProductDetailsRoute(
                            image: data.image,
                            title: data.title,
                            subTitle: data.subTitle,
                            price: data.price,
                            description: data.description,
                          ),
                        ),
                        onTap: () => errorMessage(
                          context,
                          message: context.kAppLocalizations.comingsoon,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
