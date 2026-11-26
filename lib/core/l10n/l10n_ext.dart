import 'package:flutter/widgets.dart';
import 'package:pehrawan/core/l10n/app_localizations.dart';

extension LocalizationExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
  bool get isUrdu => Localizations.localeOf(this).languageCode == 'ur';
}
