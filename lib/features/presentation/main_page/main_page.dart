import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../core/utils/theme/app_colors.dart';
import '../../../core/utils/constant/app_images.dart';
import '../../../core/utils/constant/app_svgs.dart';
import '../../../core/utils/extension/extension.dart';
import 'cart_page/view/cart_page.dart';
import 'chat_page/views/chat_page.dart';
import 'favourite_page/view/favourite_page.dart';
import 'home_page/view/home_page.dart';
import 'profile_page/view/profile_page.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List<Widget> tabs = [
    const HomePage(),
    const ChatPage(),
    const CartPage(),
    const FavouritePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs.elementAt(currentIndex),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(context.height * 0.010),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(context.height * 0.022),
          child: SalomonBottomBar(
            margin: EdgeInsets.all(context.height * 0.010),
            itemPadding: EdgeInsets.symmetric(
              horizontal: context.height * 0.020,
              vertical: context.height * 0.015,
            ),
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            currentIndex: currentIndex,
            backgroundColor: context.kChangeTheme.primaryColor,
            selectedItemColor: AppColors.kSecondColor,
            unselectedItemColor: Color(0xffA5EEC5),
            items: [
              SalomonBottomBarItem(
                icon: SvgPicture.asset(
                  AppSvgs.kHome,
                  colorFilter: ColorFilter.mode(
                    AppColors.kIconColor,
                    BlendMode.srcIn,
                  ),
                ),
                title: Text(
                  context.kAppLocalizations.home,
                  style: context.kTextTheme.labelMedium!.copyWith(
                    color: context.kChangeTheme.hintColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(AppSvgs.kChat),
                title: Text(
                  context.kAppLocalizations.chat,
                  style: context.kTextTheme.labelMedium!.copyWith(
                    color: context.kChangeTheme.hintColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SalomonBottomBarItem(
                icon: Image.asset(
                  AppImages.kIconCart,
                  height: context.height * 0.024,
                  width: context.height * 0.024,
                ),
                title: Text(
                  context.kAppLocalizations.cart,
                  style: context.kTextTheme.labelMedium!.copyWith(
                    color: context.kChangeTheme.hintColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite, color: AppColors.kIconColor),
                title: Text(
                  context.kAppLocalizations.favourite,
                  style: context.kTextTheme.labelMedium!.copyWith(
                    color: context.kChangeTheme.hintColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(AppSvgs.kProfile),
                title: Text(
                  context.kAppLocalizations.profile,
                  style: context.kTextTheme.labelMedium!.copyWith(
                    color: context.kChangeTheme.hintColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
