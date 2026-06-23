import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_ninja/features/presentation/auth/otp_page/view/otp_page.dart';
import 'package:food_ninja/features/presentation/auth/sign_up_page/view/sign_up_page.dart';
import 'package:food_ninja/features/presentation/auth/sign_up_page/view/signup_process_page.dart';

import '../../features/presentation/auth/login_in_page/view/login_page.dart';
import '../../features/presentation/main_page/cart_page/view/cart_page.dart';
import '../../features/presentation/main_page/cart_page/view/confirm_order_page.dart';
import '../../features/presentation/main_page/cart_page/view/order_location_page.dart';
import '../../features/presentation/main_page/cart_page/view/payment_method_page.dart';
import '../../features/presentation/main_page/chat_page/views/call_ranging_page.dart';
import '../../features/presentation/main_page/chat_page/views/chat_details_page.dart';
import '../../features/presentation/main_page/chat_page/views/chat_page.dart';
import '../../features/presentation/main_page/favourite_page/view/favourite_page.dart';
import '../../features/presentation/main_page/home_page/view/beverages_page.dart';
import '../../features/presentation/main_page/home_page/view/filters_page.dart';
import '../../features/presentation/main_page/home_page/view/groceries_page.dart';
import '../../features/presentation/main_page/home_page/view/home_page.dart';
import '../../features/presentation/main_page/main_page.dart';
import '../../features/presentation/main_page/profile_page/view/orders_page.dart';
import '../../features/presentation/main_page/profile_page/view/personal_details_page.dart';
import '../../features/presentation/main_page/profile_page/view/profile_page.dart';
import '../../features/presentation/notifiaction_page/view/notifiaction_page.dart';
import '../../features/presentation/onboarding_page/onboarding_page.dart';
import '../../features/presentation/product_details_page/view/product_details_page.dart';
import '../../features/presentation/splash_page/splash_page.dart';
import '../utils/constant/app_enums.dart';

part 'router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: FavouriteRoute.page),
    AutoRoute(page: SignupProcessRoute.page),
    AutoRoute(page: OtpRoute.page),
    AutoRoute(page: OrdersRoute.page),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: ProfileRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: ProductDetailsRoute.page),
    AutoRoute(page: GroceriesRoute.page),
    AutoRoute(page: BeveragesRoute.page),
    AutoRoute(page: ChatRoute.page),
    AutoRoute(page: ChatDetailsRoute.page),
    AutoRoute(page: CallRangingRoute.page),
    AutoRoute(page: CartRoute.page),
    AutoRoute(page: PersonalDetailsRoute.page),
    AutoRoute(page: ConfirmOrderRoute.page),
    AutoRoute(page: OrderLocationRoute.page),
    AutoRoute(page: PaymentMethodRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: FiltersRoute.page),
    AutoRoute(page: NotifiactionRoute.page),
  ];
}
