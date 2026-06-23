import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/components/custom_snakbar.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/constant/app_strings.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../data/providers/auth/delete/delete_account_provider.dart';
import '../../../../data/providers/auth/get/get_user_provider.dart';
import '../../../../data/providers/auth/post/complete_profile_provider.dart';
import '../../../../data/providers/auth/post/logout_provider.dart';
import '../../../../data/providers/provider.dart';
import '../widget/dialog_widget.dart';
import '../widget/language_widget.dart';
import '../widget/list_tile_items.dart';
import '../widget/profile_list_tile_widget.dart';
import '../widget/theme_widget.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    Future.microtask(() {
      ref.read(getUserProvider.notifier).getUser();
    });
    super.initState();
  }

  Future<void> removeToken() async {
    await ref.read(prefsProvider).remove(kToken);
    context.router.replaceAll([SplashRoute()]);
  }

  Future<void> deleteAccount() async {
    final notifier = ref.read(deleteAccountProvider.notifier);
    await notifier.deleteAccount();
    await removeToken();
  }

  Future<void> logOut() async {
    final notifier = ref.read(logOutProvider.notifier);
    await notifier.logOut();
    await removeToken();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(getUserProvider);
    ref.watch(completeProfileProvider);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.kPatternBackground),
          ListView(
            padding: EdgeInsetsDirectional.only(
              start: context.height * 0.020,
              end: context.height * 0.020,
              top: context.height * 0.060,
              bottom: context.height * 0.080,
            ),
            children: [
              ProfileListTileWidget(),
              SizedBox(height: context.height * 0.015),
              ListTileItems(
                backgroungColor: context.kChangeTheme.primaryColor,
                title: context.kAppLocalizations.personaldetails,
                leadingIcon: Icons.person,
                trailingIcon: Icons.arrow_forward_ios_rounded,
                iconColor: context.kChangeTheme.hintColor,
                titleColor: context.kChangeTheme.hintColor,
                onTap: () => context.router.push(PersonalDetailsRoute()),
              ),
              ListTileItems(
                backgroungColor: context.kChangeTheme.primaryColor,
                title: context.kAppLocalizations.orders,
                leadingIcon: FontAwesomeIcons.boxOpen,
                trailingIcon: Icons.arrow_forward_ios_rounded,
                iconColor: context.kChangeTheme.hintColor,
                titleColor: context.kChangeTheme.hintColor,
                onTap: () => context.router.push(OrdersRoute()),
              ),
              ListTileItems(
                backgroungColor: context.kChangeTheme.primaryColor,
                title: context.kAppLocalizations.language,
                leadingIcon: Icons.language,
                trailingIcon: Icons.arrow_forward_ios_rounded,
                iconColor: context.kChangeTheme.hintColor,
                titleColor: context.kChangeTheme.hintColor,
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return LanguageWidget();
                  },
                ),
              ),
              ListTileItems(
                backgroungColor: context.kChangeTheme.primaryColor,
                title: context.kAppLocalizations.theme,
                leadingIcon: Icons.wb_sunny,
                trailingIcon: Icons.arrow_forward_ios_rounded,
                iconColor: context.kChangeTheme.hintColor,
                titleColor: context.kChangeTheme.hintColor,
                onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ThemeWidget();
                  },
                ),
              ),
              ListTileItems(
                backgroungColor: context.kChangeTheme.primaryColor,
                title: context.kAppLocalizations.paymentmethods,
                leadingIcon: Icons.payment,
                trailingIcon: Icons.arrow_forward_ios_rounded,
                iconColor: context.kChangeTheme.hintColor,
                titleColor: context.kChangeTheme.hintColor,
                onTap: () => context.router.push(PaymentMethodRoute()),
              ),
              ListTileItems(
                backgroungColor: context.kChangeTheme.primaryColor,
                title: context.kAppLocalizations.notifications,
                leadingIcon: Icons.notifications_none,
                trailingIcon: Icons.arrow_forward_ios_rounded,
                iconColor: context.kChangeTheme.hintColor,
                titleColor: context.kChangeTheme.hintColor,
                onTap: () => context.router.push(NotifiactionRoute()),
              ),
              ListTileItems(
                backgroungColor: context.kChangeTheme.primaryColor,
                title: context.kAppLocalizations.about,
                leadingIcon: Icons.info_outline,
                trailingIcon: Icons.arrow_forward_ios_rounded,
                iconColor: context.kChangeTheme.hintColor,
                titleColor: context.kChangeTheme.hintColor,
                onTap: () => errorMessage(
                  context,
                  message: context.kAppLocalizations.comingsoon,
                ),
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  ref.listen(deleteAccountProvider, (_, state) {
                    if (state is DeleteAccountFailure) {
                      errorMessage(context, message: state.errMessage);
                      return;
                    }
                    if (state is DeleteAccountSuccess) {
                      successMessage(
                        context,
                        message: context
                            .kAppLocalizations
                            .accountdeletedsuccessfully,
                      );
                    }
                  });
                  return ListTileItems(
                    backgroungColor: context.kChangeTheme.primaryColor,
                    title: context.kAppLocalizations.deleteanaccount,
                    leadingIcon: Icons.delete,
                    trailingIcon: Icons.arrow_forward_ios_rounded,
                    titleColor: AppColors.kRed,
                    iconColor: AppColors.kRed,
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return DialogWidget(
                          title: context.kAppLocalizations.confirmdelete,
                          content: context
                              .kAppLocalizations
                              .areyousureyouwanttodeleteyouraccount,
                          confirmTitle: context.kAppLocalizations.confirm,
                          cancelTitle: context.kAppLocalizations.cancel,
                          color: AppColors.kRed,
                          confirmOnTap: () => deleteAccount(),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              ref.listen(logOutProvider, (_, state) {
                if (state is LogoutFailure) {
                  errorMessage(context, message: state.errMessage);
                  return;
                }
                if (state is LogoutSuccess) {
                  successMessage(
                    context,
                    message: context.kAppLocalizations.loggedoutsuccessfully,
                  );
                }
              });
              return Positioned(
                left: 20,
                right: 20,
                bottom: 0,
                child: ListTileItems(
                  title: context.kAppLocalizations.logout,
                  backgroungColor: context.kChangeTheme.primaryColorLight,
                  textAlign: TextAlign.center,
                  leadingIcon: Icons.logout,
                  titleColor: AppColors.kSecondColor,
                  iconColor: AppColors.kSecondColor,
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return DialogWidget(
                        title: context.kAppLocalizations.confirmlogout,
                        content:
                            context.kAppLocalizations.areyousureyouwanttologout,
                        confirmTitle: context.kAppLocalizations.confirm,
                        cancelTitle: context.kAppLocalizations.cancel,
                        color: AppColors.kPrimaryColor,
                        confirmOnTap: () => logOut(),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
