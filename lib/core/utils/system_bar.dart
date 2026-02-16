import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:securedtrade/core/theme/app_colors.dart';

import 'enums.dart';

class SystemUI {
  SystemUI._();

  static void set(StatusBarStyle style) {
    switch (style) {
      case StatusBarStyle.lightTransparent:
        _apply(
          iconBrightness: Brightness.light,
          brightness: Brightness.light,
          color: Colors.transparent,
        );
        break;

      case StatusBarStyle.darkTransparent:
        _apply(
          iconBrightness: Brightness.dark,
          brightness: Brightness.dark,
          color: Colors.transparent,
        );
        break;

      case StatusBarStyle.darkWhite:
        _apply(
          iconBrightness: Brightness.dark,
          brightness: Brightness.dark,
          color: AppColors.white,
        );
        break;

      case StatusBarStyle.lightPrimary:
        _apply(
          iconBrightness: Brightness.light,
          brightness: Brightness.light,
          color: AppColors.primary,
        );
        break;
    }
  }

  static void _apply({
    required Brightness iconBrightness,
    required Brightness brightness,
    required Color color,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: iconBrightness, // Android
        statusBarBrightness: brightness, // iOS
        statusBarColor: color,
      ),
    );
  }
}
