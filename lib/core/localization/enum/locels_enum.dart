import 'package:flutter/material.dart';

enum LocaleEnum {
  tr(Locale('tr', 'TR')),
  en(Locale('en', 'US'));

  const LocaleEnum(this.locale);

  final Locale locale;
}
