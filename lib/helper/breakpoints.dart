import 'package:flutter/material.dart';

class Breakpoints {
  static String getCurrentDevice(BuildContext context) {
    if (MediaQuery.of(context).size.width > 768) {
      return "lg";
    } else if (MediaQuery.of(context).size.width > 360 &&
        MediaQuery.of(context).size.width < 768) {
      return "md";
    }
    return "sm";
  }
}
