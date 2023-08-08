import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import 'package:app/model/theme.dart';
import 'package:app/helpers/HexColor.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ThemeProvider extends ChangeNotifier {
  static Map<String, dynamic> themes = {
    "blue": ThemeData(
        accentColor: Colors.blue,
        primarySwatch: Colors.blue,
        fontFamily: "Verdana",
        primaryColor: Colors.lightBlue,
        radioTheme: RadioThemeData(
            fillColor:
                MaterialStateProperty.resolveWith((states) => Colors.blue)),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          background: Colors.white,
          primary: Colors.lightBlue,
          primaryContainer: Colors.grey,
          onPrimaryContainer: Colors.white,
          surfaceVariant: Color(0xFF505050),
          onPrimary: Color(0xFF505050),
          secondary: Color(0xFFBBBBBB),
          onSecondary: Color(0xFFEAEAEA),
          error: Color(0xFFF32424),
          onError: Color(0xFFF32424),
          onBackground: Color(0xFFFFFFFF),
          surface: Colors.grey,
          onSurface: Colors.grey,
        ),
        dividerColor: Colors.blue,
        buttonColor: Colors.blueGrey,
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.deepPurple, textTheme: ButtonTextTheme.normal),
        textTheme: GoogleFonts.robotoCondensedTextTheme(TextTheme(
          bodyLarge: TextStyle(fontSize: 22),
          bodyMedium: TextStyle(fontSize: 18),
          bodySmall: TextStyle(fontSize: 16),
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        )),
        listTileTheme: ListTileThemeData(iconColor: Colors.black)),
    "green": ThemeData(
        accentColor: Colors.green,
        primarySwatch: Colors.green,
        fontFamily: "Arial",
        buttonColor: Colors.greenAccent,
        dividerColor: Colors.green,
        primaryColor: Colors.lightGreen,
        listTileTheme: ListTileThemeData(iconColor: Colors.black),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.greenAccent, textTheme: ButtonTextTheme.normal),
        radioTheme: RadioThemeData(
            fillColor:
                MaterialStateProperty.resolveWith((states) => Colors.green)),
        textTheme: GoogleFonts.pacificoTextTheme(TextTheme(
          bodyLarge: TextStyle(fontSize: 22),
          bodyMedium: TextStyle(fontSize: 18),
          bodySmall: TextStyle(fontSize: 16),
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ))),
    "yellow": ThemeData(
        dividerColor: Colors.green,
        fontFamily: "Georgia",
        hoverColor: Colors.grey,
        radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.resolveWith(
          (states) => Colors.yellow[800],
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, foregroundColor: Colors.black)),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          background: Colors.white,
          primary: Colors.brown,
          primaryContainer: Colors.orange,
          onPrimaryContainer: Colors.white,
          surfaceVariant: Color(0xFF505050),
          onPrimary: Colors.grey,
          secondary: Color(0xFFBBBBBB),
          onSecondary: Color(0xFFEAEAEA),
          error: Color(0xFFF32424),
          onError: Color(0xFFF32424),
          onBackground: Color(0xFFFFFFFF),
          surface: Colors.grey,
          onSurface: Colors.grey,
        ),
        listTileTheme: ListTileThemeData(iconColor: Colors.black),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 22),
          bodyMedium: TextStyle(fontSize: 18),
          bodySmall: TextStyle(fontSize: 16),
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        )),
  };
  static Map<String, dynamic> config = {
    "blue": {
      "outlineBorder": true,
    },
    "yellow": {
      "outlineBorder": true,
    },
    "green": {
      "outlineBorder": true,
    },
    "dynamic": {"outlineBorder": true}
  };
  ThemeData _chosenTheme = themes["yellow"];
  String _chosenThemeString = "yellow";

  void setTheme(String gotTheme) {
    _chosenTheme = themes[gotTheme];
    _chosenThemeString = gotTheme;
    notifyListeners();
  }

  void setDynamicTheme(CustomTheme theme) async {
    try {
      _chosenTheme = ThemeData(
          hoverColor: HexColor(theme.colors?.hoverColor as String),
          radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.resolveWith(
            (states) => HexColor(theme.colors?.radioFillColor as String),
          )),
          colorScheme: ColorScheme(
            brightness: theme.colors?.brightness as String == "Bright"
                ? Brightness.light
                : Brightness.dark,
            background: Colors.white,
            primary: HexColor(theme.colors?.primaryColor as String),
            primaryContainer:
                HexColor(theme.colors?.primaryContainer as String),
            onPrimaryContainer:
                HexColor(theme.colors?.onPrimaryContainer as String),
            surfaceVariant: HexColor(theme.colors?.primaryContainer as String),
            onPrimary: HexColor(theme.colors?.onPrimary as String),
            secondary: HexColor(theme.colors?.secondary as String),
            onSecondary: HexColor(theme.colors?.onSecondary as String),
            error: HexColor(theme.colors?.errorColor as String),
            onError: HexColor(theme.colors?.onError as String),
            onBackground: HexColor(theme.colors?.onPrimary as String),
            surface: HexColor("#d4d4d4"),
            onSurface: HexColor("#d3d3d3"),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      HexColor(theme.colors?.buttonColor as String),
                  textStyle: TextStyle(
                      fontSize: theme.fonts?.buttonFontSize as double),
                  padding: EdgeInsets.all(theme.fonts?.buttonPadding as double),
                  foregroundColor:
                      HexColor(theme.colors?.buttonTextColor as String))),
          listTileTheme: ListTileThemeData(
              iconColor: HexColor(theme.colors?.iconColor as String)),
          textTheme: GoogleFonts.getTextTheme(
              theme.fonts?.textTheme as String,
              TextTheme(
                bodyLarge: TextStyle(
                  fontSize: double.parse(
                      theme.fonts?.bodyLarge?.fontSize.toString() as String),
                ),
                bodyMedium: TextStyle(
                  fontSize: double.parse(
                      theme.fonts?.bodyMedium?.fontSize.toString() as String),
                ),
                bodySmall: TextStyle(
                  fontSize: double.parse(
                      theme.fonts?.bodySmall?.fontSize.toString() as String),
                ),
                displayLarge: TextStyle(
                    fontSize: double.parse(theme.fonts?.displayLarge?.fontSize
                        .toString() as String),
                    fontWeight: FontWeight.bold),
                displayMedium: TextStyle(
                    fontSize: double.parse(theme.fonts?.displayMedium?.fontSize
                        .toString() as String),
                    fontWeight: FontWeight.bold),
                displaySmall: TextStyle(
                    fontSize: double.parse(theme.fonts?.displaySmall?.fontSize
                        .toString() as String),
                    fontWeight: FontWeight.bold),
              )));
    } catch (error) {
      print("error inside");
      await Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_SHORT,
          webShowClose: true,
          timeInSecForIosWeb: 3);
    }

    _chosenThemeString = "dynamic";
    notifyListeners();
  }

  ThemeData get theme => _chosenTheme;
  String get themeString => _chosenThemeString;

  set theme(ThemeData newTheme) {
    _chosenTheme = newTheme;
    notifyListeners();
  }
}
