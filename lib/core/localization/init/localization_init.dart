import 'package:debt_tracker/core/localization/enum/locels_enum.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

export 'package:easy_localization/easy_localization.dart';

class LocalizationInit extends EasyLocalization {
  LocalizationInit({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedLocales,
          path: _path,
          useOnlyLangCode: true,
          fallbackLocale: LocaleEnum.en.locale,
        );

  static final _supportedLocales = [
    LocaleEnum.tr.locale,
    LocaleEnum.en.locale,
  ];

  static const _path = 'assets/translations';

  static void updateLanguage({
    required BuildContext context,
    required LocaleEnum localeEnum,
  }) {
    context.setLocale(localeEnum.locale);
  }

  static Future<void> init() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableBuildModes = [];
  }
}
