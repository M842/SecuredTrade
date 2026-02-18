import 'package:flutter/widgets.dart';

class AppSpacing {
  AppSpacing._();

  /// Vertical space
  static Widget h(double height) => SizedBox(height: height);

  /// Horizontal space
  static Widget w(double width) => SizedBox(width: width);

  /// Common spacing presets (optional but 🔥)
  static const Widget h4 = SizedBox(height: 4);
  static const Widget h8 = SizedBox(height: 8);
  static const Widget h12 = SizedBox(height: 12);
  static const Widget h16 = SizedBox(height: 16);
  static const Widget h20 = SizedBox(height: 20);
  static const Widget h25 = SizedBox(height: 25);

  static const Widget w4 = SizedBox(width: 4);
  static const Widget w8 = SizedBox(width: 8);
  static const Widget w12 = SizedBox(width: 12);
  static const Widget w16 = SizedBox(width: 16);
}
