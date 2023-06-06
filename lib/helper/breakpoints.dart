import 'package:flutter/material.dart';

enum Sizes { mobile, tablet, large }

class Breakpoints {
  static Sizes getCurrentDevice(BuildContext context) {
    if (MediaQuery.of(context).size.width > 768) {
      return Sizes.large;
    } else if (MediaQuery.of(context).size.width > 360 &&
        MediaQuery.of(context).size.width < 768) {
      return Sizes.tablet;
    }
    return Sizes.mobile;
  }
}
