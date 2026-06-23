import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/theme/app_colors.dart';
import '../../../core/utils/constant/app_enums.dart';
import '../../../core/utils/constant/app_images.dart';
import '../../../core/utils/extension/extension.dart';
import '../../../core/router/router.dart';
import '../../data/providers/auth/get/get_user_provider.dart';
import '../../data/providers/localization_provider.dart';
import '../../data/providers/provider.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    Future.microtask(() {
      ref
          .read(localizationProvider.notifier)
          .localizationFunc(Localization.initial);
      ref.read(getUserProvider.notifier).getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prefs = ref.read(prefsProvider);
    final state = ref.watch(getUserProvider);
    ref.listen(getUserProvider, (_, state) {
      if (state is GetUserFailure) {
        final onBoarding = prefs.getBool("isSaved");
        if (onBoarding == true) {
          context.router.replace(LoginRoute());
        } else {
          context.router.replace(OnboardingRoute());
        }
        return;
      }
      if (state is GetUserSuccess) {
        if (state.userModel.isCompleteProfile ?? false) {
          context.router.replace(MainRoute());
        } else {
          context.router.replaceAll([LoginRoute(), SignupProcessRoute()]);
        }
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.kOnboardingPattern, fit: BoxFit.cover),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.kLogo),
                Text(
                  textAlign: TextAlign.center,
                  "FoodNinja",
                  style: context.kTextTheme.displayLarge!.copyWith(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Deliever Favorite Food",
                  style: context.kTextTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: context.kChangeTheme.hintColor,
                  ),
                ),
                SizedBox(height: context.height * 0.030),
                state is GetUserLoading
                    ? CircularProgressIndicator(
                        color: context.kChangeTheme.hintColor,
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
