import 'package:flutter/material.dart';
import 'dart:html';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/helper/hex_color.dart';
import 'dart:convert';
import 'package:app/helper/breakpoints.dart';

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
      "colorsPickerWidth": 100,
      "colorsPickerHeight": 50
    },
    "md": {
      "colorsGridSize": 3,
      "colorsPickerWidth": 100,
      "colorsPickerHeight": 50,
    },
    "lg": {
      "colorsGridSize": 3,
      "colorsPickerWidth": 180,
      "colorsPickerHeight": 50
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
  List<String> fonts = GoogleFonts.asMap().keys.toList();

  String colorSelectableItem = "primary";
  String selectableFont = "Abel";
  String themeSelectableItem = "Bright";
  Color selectable = Colors.blue;

  Map<String, Color> chosenColors = {
    "primary": Colors.blue,
    "accent": Colors.blue,
    "card": Color.fromARGB(192, 165, 161, 161),
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
    "primary":
        "It is the main color throughout the whole design style. Includes top banner, input field  selected color,",
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
    "bodySmall": {"fontSize": 10, "fontWeight": 300},
    "bodyMedium": {"fontSize": 20, "fontWeight": 300},
    "bodyLarge": {"fontSize": 30, "fontWeight": 300},
    "displaySmall": {"fontSize": 35, "fontWeight": 300},
    "displayMedium": {"fontSize": 46, "fontWeight": 300},
    "displayLarge": {"fontSize": 55, "fontWeight": 300}
  };
  Map<String, String> stylesExplanation = {
    "bodySmall": "Normal text smallest size - e.g: 10px sized",
    "bodyMedium": "Normal text medium sized - e.g: 16px sized",
    "bodyLarge": "Normal text large sized - e.g: 22px sized",
    "displaySmall":
        "Headline text smallest sized e.g: 34px (subtitle of a title's title)",
    "displayMedium":
        "Headline text medium sized e.g: 44px (subtitle of a title)",
    "displayLarge": "Headline text large sized e.g.: 56 px (title)"
  };

  double buttonFontSize = 16;
  double buttonPadding = 20;

  int fontWeightActive = 300;
  bool activeBorderForInputs = false;

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
                      fontSize: stylesValues["bodyLarge"]["fontSize"]),
                  bodyMedium: TextStyle(
                      fontSize: stylesValues["bodyMedium"]["fontSize"]),
                  bodySmall: TextStyle(
                      fontSize: stylesValues["bodySmall"]["fontSize"]),
                  displayLarge: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: stylesValues["displayLarge"]["fontSize"]),
                  displayMedium: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: stylesValues["displayMedium"]["fontSize"]),
                  displaySmall: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: stylesValues["displaySmall"]["fontSize"]),
                )),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: chosenColors["button"],
                    foregroundColor: chosenColors["buttonText"]))),
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
                    title: Text("Flutter Designer"),
                    backgroundColor: chosenColors["primary"]!,
                    foregroundColor: chosenColors["onPrimary"],
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        "Colors",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Text("Choose color for each setup: ")),
                  SizedBox(height: 30),
                  GridView.count(
                    crossAxisCount: breakpointsSettings[
                            Breakpoints.getCurrentDevice(context)]
                        ["colorsGridSize"],
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        MediaQuery.of(context).size.height,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    children: [
                      for (var color in colors) ...[
                        Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(color,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text(colorExplanation[color] != null
                                  ? colorExplanation[color]!
                                  : "N/A"),
                              SizedBox(height: 10),
                              InkWell(
                                onTap: () => {
                                  showDialog(
                                      context: context,
                                      builder: (builder) {
                                        return AlertDialog(
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () => {
                                                      setState(() => {
                                                            chosenColors[
                                                                    color!] =
                                                                selectable
                                                          }),
                                                      Navigator.of(context)
                                                          .pop()
                                                    },
                                                child: Text("Save"))
                                          ],
                                          title:
                                              Text("$color :: Pick a color:: "),
                                          content: SingleChildScrollView(
                                              child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16, right: 16),
                                            child: SizedBox(
                                              width: 350,
                                              child: HueRingPicker(
                                                  portraitOnly: true,
                                                  displayThumbColor: true,
                                                  enableAlpha: true,
                                                  pickerColor:
                                                      chosenColors[color]!,
                                                  onColorChanged: (color) =>
                                                      {selectable = color}),
                                            ),
                                          )),
                                        );
                                      })
                                },
                                child: Container(
                                    width: breakpointsSettings[
                                        Breakpoints.getCurrentDevice(
                                            context)]["colorsPickerWidth"],
                                    height: breakpointsSettings[
                                        Breakpoints.getCurrentDevice(
                                            context)]["colorsPickerHeight"],
                                    child: Center(
                                      child: Text("Change color",
                                          style: TextStyle(
                                              color: chosenColors[
                                                  "onPrimaryContainer"])),
                                    ),
                                    color: color != ""
                                        ? Color.fromRGBO(
                                            chosenColors[color]!.red,
                                            chosenColors[color]!.green,
                                            chosenColors[color]!.blue,
                                            0.95)
                                        : Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ]
                    ],
                  ),
                  Divider(),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Styles",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Theme",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                return chosenColors["radioFill"]!;
                              }),
                              groupValue: themeSelectableItem,
                              onChanged: (e) => {
                                setState(() => {themeSelectableItem = e!})
                              },
                              value: "Bright",
                            ),
                            Icon(Icons.light_mode, color: chosenColors["icon"]),
                            Radio(
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                return chosenColors["radioFill"]!;
                              }),
                              groupValue: themeSelectableItem,
                              onChanged: (e) => {
                                setState(() => {themeSelectableItem = e!})
                              },
                              value: "Dark",
                            ),
                            Icon(Icons.mode_night, color: chosenColors["icon"]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 50, left: 50),
                        child: Text("Typography",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 50),
                            Tooltip(
                              child: DropdownButton(
                                  value: selectableFont,
                                  items: fonts
                                      .map((font) => DropdownMenuItem(
                                            child: Text(font),
                                            value: font,
                                          ))
                                      .toList(),
                                  onChanged: (item) => {
                                        setState(() => {selectableFont = item!})
                                      }),
                              message: "Check www.fonts.google.com",
                            ),
                          ],
                        ),
                      ),
                      // Center(
                      //   child: SizedBox(
                      //     width: 200,
                      //     child: TextField(
                      //       decoration:
                      //           InputDecoration(labelText: "Button font size e.g: 20"),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text("Setup headline, normal text ",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                        child: Center(
                            child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: styles.length,
                          itemBuilder: (context, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(styles[index],
                                    style: TextStyle(
                                        fontSize: stylesValues[styles[index]]
                                            ["fontSize"])),
                                Text(stylesExplanation[styles[index]]!,
                                    style:
                                        Theme.of(context).textTheme.labelLarge),
                                SizedBox(height: 20),
                                Text("Font Size",
                                    style:
                                        Theme.of(context).textTheme.labelLarge),
                                SizedBox(height: 10),
                                SizedBox(
                                  width: 250,
                                  child: Slider(
                                    divisions: 9,
                                    min: 1,
                                    max: 100,
                                    label:
                                        "${stylesValues[styles[index]]["fontSize"]}",
                                    onChanged: (val) => {
                                      setState(() => {
                                            stylesValues[styles[index]]
                                                ["fontSize"] = val,
                                          })
                                    },
                                    value: stylesValues[styles[index]]
                                        ["fontSize"],
                                  ),
                                )
                              ]),
                        )),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Buttons",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Text("Font size",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge),
                                    Slider(
                                      onChanged: (value) =>
                                          {buttonFontSize = value},
                                      min: 0,
                                      max: 30,
                                      label: "${buttonFontSize}",
                                      divisions: 9,
                                      value: buttonFontSize,
                                    ),
                                    Text("Button size",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge),
                                    Slider(
                                      onChanged: (value) => {
                                        buttonPadding = value,
                                      },
                                      min: 0,
                                      max: 30,
                                      label: "${buttonPadding}",
                                      divisions: 5,
                                      value: buttonPadding,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Text("Input Fields",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Radio(
                                    groupValue: activeBorderForInputs,
                                    onChanged: (e) => {
                                      setState(
                                          () => {activeBorderForInputs = e!})
                                    },
                                    value: true,
                                  ),
                                  SizedBox(
                                    width: 350,
                                    height: 20,
                                    child: TextField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(5),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                    ),
                                  ),
                                  Radio(
                                    groupValue: activeBorderForInputs,
                                    onChanged: (e) => {
                                      setState(
                                          () => {activeBorderForInputs = e!})
                                    },
                                    value: false,
                                  ),
                                  SizedBox(
                                    width: 350,
                                    height: 20,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(5)),
                                      enabled: false,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              child: Text("Preview"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: chosenColors["button"],
                                  foregroundColor: chosenColors["buttonText"]),
                              onPressed: () => {
                                    setState(() => {isPreviewPageShown = true})
                                  }),
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
                  )
                ],
              ))
            ],
          ),
        )));
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
        json["Fonts"][style]["fontSize"] =
            int.parse(stylesValues[style]["fontSize"]);
        json["Fonts"][style]["fontWeight"] =
            int.parse(stylesValues[style]["fontWeight"]);
      }
    });
    json["Styles"] = {};
    json["Styles"]["outlineBorderInput"] = activeBorderForInputs;

    String encoded = jsonEncode(json);

    final bytes = utf8.encode(encoded);
    final blob = Blob([bytes]);
    final url = Url.createObjectUrlFromBlob(blob);

    AnchorElement anchor = AnchorElement()
      ..download = "Config.txt"
      ..href = url;
    anchor.click();
  }
}
