import 'package:flutter/material.dart';

class UIHelpers {
  UIHelpers._();

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
