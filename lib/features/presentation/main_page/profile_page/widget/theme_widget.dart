import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/components/custom_icon_button_pop.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../data/providers/change_theme_provider.dart';

class ThemeWidget extends ConsumerStatefulWidget {
  const ThemeWidget({super.key});

  @override
  ConsumerState<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends ConsumerState<ThemeWidget> {
  @override
  Widget build(BuildContext context) {
    ref.watch(changeThemeProvider);
    final notifier = ref.read(changeThemeProvider.notifier);
    final currentTheme = notifier.currentTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.height * 0.010),
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () async {
              await notifier.setTheme(value: true);
            },
            title: Text(
              context.kAppLocalizations.lightTheme,
              style: context.kTextTheme.titleMedium!.copyWith(
                color: context.kChangeTheme.hintColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: CustomIconButton(
              icon: Icon(
                currentTheme == true
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
          Divider(color: context.kChangeTheme.primaryColorLight),
          ListTile(
            onTap: () async {
              await notifier.setTheme(value: false);
            },
            title: Text(
              context.kAppLocalizations.darkTheme,
              style: context.kTextTheme.titleMedium!.copyWith(
                color: context.kChangeTheme.hintColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: CustomIconButton(
              icon: Icon(
                currentTheme == false
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
