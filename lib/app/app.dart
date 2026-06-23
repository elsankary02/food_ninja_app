import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utils/theme/app_theme.dart';
import '../core/router/router.dart';
import '../features/data/providers/change_theme_provider.dart';
import '../features/data/providers/localization_provider.dart';
import '../l10n/app_localizations.dart';

class FoodNinja extends ConsumerWidget {
  const FoodNinja({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(localizationProvider);
    ref.watch(changeThemeProvider);
    final notifier = ref.read(changeThemeProvider.notifier);
    final currentTheme = notifier.currentTheme;
    final locale = state is LocalizationSuccess
        ? Locale(state.isSelectedLang)
        : const Locale("en");
    return MaterialApp.router(
      routerConfig: router.config(),
      debugShowCheckedModeBanner: false,
      locale: locale,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: currentTheme ? ThemeMode.light : ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
