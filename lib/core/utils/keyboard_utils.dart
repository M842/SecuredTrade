import 'package:flutter/material.dart';

class KeyboardUtils {
  KeyboardUtils._(); // no instance

  static void dismiss(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
