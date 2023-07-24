import 'package:flutter/material.dart';

class PreThemes {
  static Map<String, Color> darkBlue = {
    "primary": Color.fromRGBO(30, 144, 255, 1),
    "accent": Color.fromRGBO(30, 144, 255, 1),
    "card": Color.fromRGBO(36, 25, 25, 1),
    "button": Color.fromRGBO(16, 52, 166, 1),
    "buttonText": Colors.black,
    "error": Colors.red,
    "primaryContainer": Color.fromRGBO(30, 144, 255, 1),
    "divider": Colors.black,
    "icon": Color.fromRGBO(30, 144, 255, 1),
    "radioFill": Color.fromRGBO(30, 144, 255, 1),
    "onPrimaryContainer": Colors.black,
    "onPrimary": Colors.white,
    "onSecondary": Colors.white,
    "onError": Colors.black,
    "hover": Color.fromRGBO(16, 52, 166, 1)
  };
  static Map<String, Color> greyAndYellow = {
    "primary": Color.fromRGBO(255, 231, 20, 1),
    "accent": Color.fromRGBO(255, 231, 20, 1),
    "card": Color.fromRGBO(107, 107, 107, 1),
    "button": Color.fromRGBO(107, 107, 107, 1),
    "buttonText": Colors.black,
    "error": Colors.red,
    "primaryContainer": Color.fromRGBO(107, 107, 107, 1),
    "divider": Colors.black,
    "icon": Colors.black,
    "radioFill": Color.fromRGBO(255, 231, 20, 1),
    "onPrimaryContainer": Colors.black,
    "onPrimary": Colors.white,
    "onSecondary": Colors.white,
    "onError": Colors.black,
    "hover": Color.fromRGBO(255, 250, 202, 1)
  };
  static Map<String, Color> bW = {
    "primary": Colors.black,
    "accent": Colors.black,
    "card": Color.fromRGBO(255, 255, 255, 1),
    "button": Color.fromRGBO(255, 255, 255, 1),
    "buttonText": Colors.black,
    "error": Colors.red,
    "primaryContainer": Color.fromRGBO(220, 220, 220, 1),
    "divider": Colors.black,
    "icon": Colors.black,
    "radioFill": Colors.black,
    "onPrimaryContainer": Colors.black,
    "onPrimary": Colors.white,
    "onSecondary": Colors.black,
    "onError": Colors.black,
    "hover": Color.fromRGBO(220, 220, 220, 1)
  };
  static Map<String, Color> green = {
    "primary": Color.fromRGBO(109, 211, 100, 1),
    "accent": Color.fromRGBO(109, 211, 100, 1),
    "card": Color.fromRGBO(109, 211, 100, 0.75),
    "button": Color.fromRGBO(41, 158, 31, 1),
    "buttonText": Colors.black,
    "error": Colors.red,
    "primaryContainer": Color.fromRGBO(227, 255, 225, 1),
    "divider": Colors.black,
    "icon": Colors.black,
    "radioFill": Color.fromRGBO(109, 211, 100, 1),
    "onPrimaryContainer": Colors.black,
    "onPrimary": Colors.white,
    "onSecondary": Colors.black,
    "onError": Colors.black,
    "hover": Color.fromRGBO(227, 255, 225, 1)
  };
  static Map<String, Color> blueLarge = {
    "primary": Color.fromRGBO(30, 144, 255, 1),
    "accent": Color.fromRGBO(30, 144, 255, 1),
    "card": Color.fromRGBO(255, 255, 255, 0.75),
    "button": Color.fromRGBO(16, 52, 166, 1),
    "buttonText": Colors.black,
    "error": Colors.red,
    "primaryContainer": Color.fromRGBO(30, 144, 255, 1),
    "divider": Colors.black,
    "icon": Color.fromRGBO(30, 144, 255, 1),
    "radioFill": Color.fromRGBO(30, 144, 255, 1),
    "onPrimaryContainer": Colors.black,
    "onPrimary": Colors.white,
    "onSecondary": Colors.white,
    "onError": Colors.black,
    "hover": Color.fromRGBO(16, 52, 166, 1)
  };
  static dynamic getTheme(String theme) {
    Map<String, Color> value = {};
    if (theme == "Blue Dark") {
      value = darkBlue;
    } else if (theme == "Grey and Yellow") {
      value = greyAndYellow;
    } else if (theme == "BW") {
      value = bW;
    } else if (theme == "Green") {
      value = green;
    } else {
      value = blueLarge;
    }
    return {
      "theme": {
        "brightness": theme.contains("Dark") ? "Dark" : "Light",
        "value": value,
      }
    };
  }
}
