import 'package:flutter/material.dart';

class Breakpoints {
  static String getCurrentDevice(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1024) {
      return "lg";
    } else if (MediaQuery.of(context).size.width > 640) {
      return "md";
    }
    return "sm";
  }
}
