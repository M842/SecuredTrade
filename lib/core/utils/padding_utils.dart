import 'package:flutter/material.dart';

class PaddingUtils {
  PaddingUtils._();

  /// All sides padding
  static EdgeInsets all(double value) {
    return EdgeInsets.all(value);
  }

  /// Symmetric padding
  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) {
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }

  /// Only padding
  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
  }
}
