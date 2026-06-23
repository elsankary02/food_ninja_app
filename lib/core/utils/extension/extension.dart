import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';

extension App on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  TextTheme get kTextTheme => Theme.of(this).textTheme;
  ThemeData get kChangeTheme => Theme.of(this);
  AppLocalizations get kAppLocalizations => AppLocalizations.of(this)!;
}
