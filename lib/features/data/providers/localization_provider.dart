import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/constant/app_enums.dart';
import 'provider.dart';

abstract class LocalizationState {}

class LocalizationInitial extends LocalizationState {}

class LocalizationSuccess extends LocalizationState {
  final String isSelectedLang;

  LocalizationSuccess({required this.isSelectedLang});
}

class LocalizationNotifier extends Notifier<LocalizationState> {
  @override
  LocalizationState build() {
    return LocalizationInitial();
  }

  localizationFunc(Localization localization) {
    final prefs = ref.read(prefsProvider);
    switch (localization) {
      case Localization.initial:
        if (prefs.getString("lang") != null) {
          if (prefs.getString("lang") == "en") {
            state = LocalizationSuccess(isSelectedLang: "en");
          } else {
            state = LocalizationSuccess(isSelectedLang: "ar");
          }
        }
        return;
      case Localization.english:
        prefs.setString("lang", "en");
        state = LocalizationSuccess(isSelectedLang: "en");
        return;
      case Localization.arabic:
        prefs.setString("lang", "ar");
        state = LocalizationSuccess(isSelectedLang: "ar");
        return;
    }
  }
}

final localizationProvider =
    NotifierProvider<LocalizationNotifier, LocalizationState>(
      LocalizationNotifier.new,
    );
