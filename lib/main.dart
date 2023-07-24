import 'package:app/widgets/colors_expandable.dart';
import 'package:app/widgets/styles_expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/helper/hex_color.dart';
import 'dart:convert';
import 'helper/pre_themes.dart';
import 'package:app/services/downloader.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// import 'package:app/services/mobile_downloader.dart'; //mobile
import 'package:app/services/web_downloader.dart';

void main() {
  runApp(MaterialApp(home: CustomTheme()));
}

class CustomTheme extends StatefulWidget {
  const CustomTheme({super.key});

  @override
  State<CustomTheme> createState() => _CustomThemeState();
}

class _CustomThemeState extends State<CustomTheme> {
  bool isPreviewPageShown = false;
  Map<String, dynamic> breakpointsSettings = {
    "sm": {
      "colorsGridSize": 2,
      "colorsPickerWidth": 30,
      "colorsPickerHeight": 30
    },
    "md": {
      "colorsGridSize": 3,
      "colorsPickerWidth": 35,
      "colorsPickerHeight": 35,
    },
    "lg": {
      "colorsGridSize": 3,
      "colorsPickerWidth": 35,
      "colorsPickerHeight": 35
    }
  };
  List<String> colors = [
    "primary",
    "accent",
    "card",
    "button",
    "buttonText",
    "error",
    "primaryContainer",
    "divider",
    "icon",
    "radioFill",
    "onPrimaryContainer",
    "onPrimary",
    "onSecondary",
    "onError",
    "hover"
  ];
  String colorSelectableItem = "primary";
  String selectableFont = "Abel";
  String themeSelectableItem = "Bright";
  Color selectable = Colors.blue;

  Map<String, Color> chosenColors = {
    "primary": Colors.blue,
    "accent": Colors.blue,
    "card": Color.fromRGBO(247, 242, 250, 1),
    "button": Colors.blue,
    "buttonText": Colors.black,
    "error": Colors.blue,
    "primaryContainer": Colors.grey,
    "divider": Colors.blue,
    "icon": Colors.blue,
    "radioFill": Colors.blue,
    "onPrimaryContainer": Color.fromARGB(144, 97, 97, 97),
    "onPrimary": Colors.black,
    "onSecondary": Colors.black,
    "onError": Colors.blue,
    "hover": Colors.blue
  };
  Map<String, String> colorExplanation = {
    "primary": "It is the main color throughout the whole design style.",
    "accent": "Secondary color of the app",
    "card": "Color of the component Card",
    "button": "Button background color",
    "buttonText": "Button foreground color",
    "error": "Color of the error - unvalidated input",
    "primaryContainer": "Background Color of the Box component",
    "divider": "Color of the dividing section - line",
    "icon": "Color of the icons inside",
    "radioFill": "Color of the radio",
    "onPrimaryContainer": "Foreground color of the Box",
    "onPrimary": "Foreground color of the app",
    "onSecondary": "Foreground color of the secondary",
    "onError": "Foreground color of the error display Components",
    "hover": "Hover color"
  };
  List<String> styles = [
    "bodySmall",
    "bodyMedium",
    "bodyLarge",
    "displaySmall",
    "displayMedium",
    "displayLarge"
  ];
  Map<String, bool> stylesExpanded = {
    "bodySmall": false,
    "bodyMedium": false,
    "bodyLarge": false,
    "displaySmall": false,
    "displayMedium": false,
    "displayLarge": false
  };
  Map<String, dynamic> stylesValues = {
    "bodySmall": {"fontSize": 10.0, "fontWeight": 300},
    "bodyMedium": {"fontSize": 20.0, "fontWeight": 300},
    "bodyLarge": {"fontSize": 30.0, "fontWeight": 300},
    "displaySmall": {"fontSize": 35.0, "fontWeight": 700},
    "displayMedium": {"fontSize": 46.0, "fontWeight": 700},
    "displayLarge": {"fontSize": 55.0, "fontWeight": 700}
  };
  Map<String, String> stylesExplanation = {
    "bodySmall": "Normal text smallest size",
    "bodyMedium": "Normal text medium sized",
    "bodyLarge": "Normal text large sized",
    "displaySmall": "Headline text smallest sized",
    "displayMedium": "Headline text medium sized",
    "displayLarge": "Headline text large sized"
  };

  List<String> customThemes = [
    "Grey and Yellow",
    "Green",
    "BW",
    "Blue",
    "Blue Dark"
  ];
  dynamic gotTheme = {};
  String selectableTheme = "Blue";
  List<String> config = ["Colors", "Styles"];

  Map<String, bool> expandableList = {"Colors": false, "Styles": false};

  double buttonFontSize = 16;
  double buttonPadding = 20;

  int fontWeightActive = 300;
  bool activeBorderForInputs = false;

  double weight = 0, changeableWeight = 700;

  void generateJSONColors() {
    Map<String, String> json = {};
    json = chosenColors
        .map((key, value) => MapEntry(key, HexColor(value.value).toHex()));
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(content: Center(child: Text(json.toString()))));
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> expandableContent = {
      "Colors": ColorsExpandable(
          context: context,
          chosenColors: chosenColors,
          onCallback: (color, value) => {
                setState(() => {chosenColors[color!] = value}),
              }),
      "Styles": StylesExpandable(
        chosenColors: chosenColors,
        selectableFont: selectableFont,
        styles: styles,
        stylesExplanation: stylesExplanation,
        stylesValues: stylesValues,
        themeSelectableItem: themeSelectableItem,
        setDynamicValues: (key, config, value) {
          setState(() => {
                if (key == "themeSelectableItem")
                  {
                    themeSelectableItem = value,
                  }
                else if (key == "selectableFont")
                  {
                    selectableFont = value,
                  }
                else if (key == "stylesValues")
                  {
                    stylesValues[config["style"]][config["property"]] = value,
                  }
                else if (key == "buttonFontSize")
                  {
                    buttonFontSize = value,
                  }
                else if (key == "buttonPadding")
                  {
                    buttonPadding = value,
                  }
                else if (key == "activeBorderForInputs")
                  {
                    activeBorderForInputs = value,
                  }
              });
        },
      )
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Theme Designer',
      theme: ThemeData(
          // This is the theme of your application.

          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: HexColor(chosenColors["primary"]!.value)
              .getMaterialColor(chosenColors["primary"]!),
          colorScheme: ColorScheme(
            brightness: themeSelectableItem == "Dark"
                ? Brightness.dark
                : Brightness.light,
            background: Colors.white,
            primary: HexColor(chosenColors["primary"]!.value)
                .getMaterialColor(chosenColors["primary"]!),
            primaryContainer: chosenColors["primaryContainer"],
            onPrimaryContainer: chosenColors["onPrimaryContainer"],
            surfaceVariant: Color(0xFF505050),
            onPrimary: chosenColors["onPrimary"]!,
            secondary: chosenColors["accent"]!,
            onSecondary: chosenColors["onSecondary"]!,
            error: chosenColors["error"]!,
            onError: chosenColors["onError"]!,
            onBackground: Color(0xFFFFFFFF),
            surface: Colors.grey,
            onSurface: Colors.grey,
          ),
          cardColor: chosenColors["card"],
          dividerColor: chosenColors["divider"],
          radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.resolveWith(
                  (states) => chosenColors["radio"])),
          iconTheme: IconThemeData(color: chosenColors["icon"]),
          textTheme: GoogleFonts.getTextTheme(
              selectableFont,
              TextTheme(
                bodyLarge: TextStyle(
                    fontSize: stylesValues["bodyLarge"]["fontSize"],
                    fontWeight: stylesValues["bodyLarge"]["fontWeight"] == 700
                        ? FontWeight.w700
                        : FontWeight.w300),
                bodyMedium: TextStyle(
                    fontSize: stylesValues["bodyMedium"]["fontSize"],
                    fontWeight: stylesValues["bodyMedium"]["fontWeight"] == 700
                        ? FontWeight.w700
                        : FontWeight.w300),
                bodySmall: TextStyle(
                    fontSize: stylesValues["bodySmall"]["fontSize"],
                    fontWeight: stylesValues["bodySmall"]["fontWeight"] == 700
                        ? FontWeight.w700
                        : FontWeight.w300),
                displayLarge: TextStyle(
                    fontSize: stylesValues["displayLarge"]["fontSize"],
                    fontWeight:
                        stylesValues["displayLarge"]["fontWeight"] == 700
                            ? FontWeight.w700
                            : FontWeight.w300),
                displayMedium: TextStyle(
                    fontWeight:
                        stylesValues["displayMedium"]["fontWeight"] == 700
                            ? FontWeight.w700
                            : FontWeight.w300,
                    fontSize: stylesValues["displayMedium"]["fontSize"]),
                displaySmall: TextStyle(
                    fontWeight:
                        stylesValues["displaySmall"]["fontWeight"] == 700
                            ? FontWeight.w700
                            : FontWeight.w300,
                    fontSize: stylesValues["displaySmall"]["fontSize"]),
              )),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: chosenColors["button"],
                  foregroundColor: chosenColors["buttonText"],
                  textStyle: TextStyle(fontSize: buttonFontSize),
                  padding: EdgeInsets.all(buttonPadding)))),
      home: Scaffold(
          body: SingleChildScrollView(
              child: Column(
        children: [
          SelectionArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: Text("Theme Designer",
                    style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 50),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Choose from the following",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 20),
                    DropdownButton(
                        value: selectableTheme,
                        items: customThemes
                            .map((theme) => DropdownMenuItem(
                                  child: Text(theme),
                                  value: theme,
                                ))
                            .toList(),
                        onChanged: (item) => {
                              setState(() => {
                                    selectableTheme = item!,
                                    gotTheme =
                                        PreThemes.getTheme(selectableTheme),
                                    chosenColors = gotTheme["theme"]["value"],
                                    themeSelectableItem =
                                        gotTheme["theme"]["brightness"],
                                  })
                            }),
                    SizedBox(height: 20),
                    Text("OR",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 20),
                    Text("Style custom",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 10),
                    Icon(Icons.arrow_downward_rounded),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() => {
                          expandableList[config[index]] = !isExpanded,
                        });
                  },
                  children: [
                    for (var item in config) ...[
                      ExpansionPanel(
                        canTapOnHeader: true,
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 60.0),
                            child: Center(
                                child: Text(item,
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold))),
                          );
                        },
                        body: expandableContent[item],
                        isExpanded: expandableList[item]!,
                      ),
                    ]
                  ]),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ElevatedButton(
                  //     child: Text("Preview"),
                  //     style: ElevatedButton.styleFrom(
                  //         backgroundColor: chosenColors["button"],
                  //         foregroundColor: chosenColors["buttonText"]),
                  //     onPressed: () => {
                  //           setState(() => {isPreviewPageShown = true})
                  //         }),
                  SizedBox(width: 10),
                  ElevatedButton(
                      child: Text("Export JSON"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: chosenColors["button"],
                          foregroundColor: chosenColors["buttonText"]),
                      onPressed: () => {exportJSON()}),
                ],
              )
            ],
          ))
        ],
      ))),
    );
  }

  void exportJSON() async {
    Map<String, dynamic> json = {};
    json["Colors"] = chosenColors
        .map((key, value) => MapEntry(key, HexColor(value.value).toHex()));
    json["Colors"]["Secondary"] =
        HexColor(chosenColors["accent"]!.value).toHex();
    json["Colors"]["Brightness"] = themeSelectableItem;

    json["Fonts"] = {};
    json["Fonts"]["textTheme"] = selectableFont;
    json["Fonts"]["buttonFontSize"] = buttonFontSize;
    json["Fonts"]["buttonPadding"] = buttonPadding;

    styles.forEach((style) {
      if (style != null) {
        json["Fonts"][style] = {};
        json["Fonts"][style]["fontSize"] = stylesValues[style]["fontSize"];
        json["Fonts"][style]["fontWeight"] = stylesValues[style]["fontWeight"];
      }
    });
    json["Styles"] = {};
    json["Styles"]["outlineBorderInput"] = activeBorderForInputs;

    String encoded = jsonEncode(json);

    final bytes = utf8.encode(encoded);

    DownloadService service = WebDownloadService();

    await service.download(bytes: bytes);
  }
}
