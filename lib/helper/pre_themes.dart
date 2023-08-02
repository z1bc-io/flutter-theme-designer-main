import 'package:app/helper/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:app/helper/hex_color_from_string.dart';

class PreThemes {
  static Map<String, Color> darkBlue = {
    "primary": HexColorString("#ff1e90ff"),
    "accent": HexColorString("#ff1e90ff"),
    "card": HexColorString("#7f241919"),
    "button": HexColorString("#ff1034a6"),
    "buttonText": Colors.white,
    "error": Colors.red,
    "primaryContainer": HexColorString("#ff2a8ceb"),
    "divider": Colors.black,
    "icon": HexColorString("#ff1e90ff"),
    "radioFill": HexColorString("#ff1e90ff"),
    "onPrimaryContainer": Colors.black,
    "onPrimary": Colors.white,
    "onSecondary": Colors.white,
    "onError": Colors.black,
    "hover": HexColorString("#ff1034a6"),
  };
  static Map<String, Color> greyAndYellow = {
    "primary": HexColorString("#ffffe714"),
    "accent": HexColorString("#ffffe714"),
    "card": HexColorString("#ffbcbcbc"),
    "button": HexColorString("#ff6b6b6b"),
    "buttonText": Colors.black,
    "error": Colors.red,
    "primaryContainer": HexColorString("#ff6b6b6b"),
    "divider": Colors.black,
    "icon": Colors.black,
    "radioFill": HexColorString("#ffffe714"),
    "onPrimaryContainer": Colors.black,
    "onPrimary": Colors.white,
    "onSecondary": Colors.black,
    "onError": Colors.black,
    "hover": HexColorString("#fffffaca")
  };
  static Map<String, Color> bW = {
    "primary": Colors.black,
    "accent": Colors.black,
    "card": Color.fromRGBO(255, 255, 255, 1),
    "button": Colors.black,
    "buttonText": Color.fromRGBO(255, 255, 255, 1),
    "error": Colors.red,
    "primaryContainer": HexColorString("#ffb8b7b7"),
    "divider": Colors.black,
    "icon": Colors.black,
    "radioFill": Colors.black,
    "onPrimaryContainer": Colors.black,
    "onPrimary": Colors.white,
    "onSecondary": Colors.black,
    "onError": Colors.black,
    "hover": HexColorString("#ffdcdcdc")
  };
  static Map<String, Color> green = {
    "primary": HexColorString("#ffa1ee9a"),
    "accent": HexColorString("#ffa1ee9a"),
    "card": HexColorString("#ffefffed"),
    "button": HexColorString("#ff299e1f"),
    "buttonText": Colors.black,
    "error": Colors.red,
    "primaryContainer": HexColorString("#ff77c672"),
    "divider": Colors.black,
    "icon": Colors.black,
    "radioFill": HexColorString("#ff9ae094"),
    "onPrimaryContainer": Colors.black,
    "onPrimary": Colors.white,
    "onSecondary": Colors.black,
    "onError": Colors.black,
    "hover": HexColorString("#ffe3ffe1")
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
