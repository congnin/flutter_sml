import 'dart:async';

import 'package:flutter/material.dart';

class InheritedWidgetLocalizations {
  static InheritedWidgetLocalizations of(BuildContext context) {
    return Localizations.of<InheritedWidgetLocalizations>(
        context, InheritedWidgetLocalizations);
  }

  String get appTitle => 'InheritedWidget Example';
}

class InheritedWidgetLocalizationsDelegate
    extends LocalizationsDelegate<InheritedWidgetLocalizations> {
  @override
  Future<InheritedWidgetLocalizations> load(Locale locale) =>
      Future(() => InheritedWidgetLocalizations());

  @override
  bool shouldReload(InheritedWidgetLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains('en');
}
