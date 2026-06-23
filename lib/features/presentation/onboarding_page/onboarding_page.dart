import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/custom_primary_button.dart';
import '../../../core/utils/theme/app_colors.dart';
import '../../../core/utils/extension/extension.dart';
import '../../../core/router/router.dart';
import '../../data/models/onboarding_model.dart';
import '../../data/providers/provider.dart';

@RoutePage()
class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: onboardingItems(context).length,
              itemBuilder: (context, index) => ListView(
                children: [
                  SizedBox(height: context.height * 0.040),
                  Image.asset(
                    onboardingItems(context)[index].image,
                    height: context.height * 0.5,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: context.height * 0.059),
                  Text(
                    textAlign: TextAlign.center,
                    onboardingItems(context)[index].title,
                    style: context.kTextTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.kChangeTheme.hintColor,
                    ),
                  ),
                  SizedBox(height: context.height * 0.020),
                  Text(
                    textAlign: TextAlign.center,
                    onboardingItems(context)[index].subTitle,
                    style: context.kTextTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: context.kChangeTheme.hintColor,
                    ),
                  ),
                  SizedBox(height: context.height * 0.042),
                ],
              ),
            ),
          ),
          UnconstrainedBox(
            child: CustomPrimaryButton(
              title: context.kAppLocalizations.next,
              style: context.kTextTheme.titleMedium!.copyWith(
                color: AppColors.kWhite,
                fontWeight: FontWeight.w700,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: context.height * 0.060,
                vertical: context.height * 0.018,
              ),
              gradient: const LinearGradient(
                begin: AlignmentGeometry.topLeft,
                end: AlignmentGeometry.bottomRight,
                colors: [AppColors.kPrimaryColor, AppColors.kSecondColor],
              ),
              borderRadius: BorderRadius.circular(context.height * 0.015),
              onTap: () {
                if (currentIndex == onboardingItems(context).length - 1) {
                  context.router.replace(LoginRoute());
                  ref.read(prefsProvider).setBool("isSaved", true);
                }
                pageController.animateToPage(
                  ++currentIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
            ),
          ),
          SizedBox(height: context.height * 0.050),
        ],
      ),
    );
  }
}
