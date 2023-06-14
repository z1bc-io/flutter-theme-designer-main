import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/helper/hex_color.dart';
import 'dart:convert';
import 'package:app/pages/preview/preview.dart';

class CustomTheme extends StatefulWidget {
  const CustomTheme({super.key});

  @override
  State<CustomTheme> createState() => _CustomThemeState();
}

class _CustomThemeState extends State<CustomTheme> {
  bool isPreviewPageShown = false;
  List<String> colors = [
    "",
    "primary",
    "accent",
    "card",
    "button",
    "buttonText",
    "error",
    "brightness",
    "primaryContainer",
    "divider"
        "icon",
    "radioFill",
    "onPrimaryContainer",
    "onPrimary",
    "onSecondary",
    "onError",
    "hover"
  ];
  List<String> fonts = GoogleFonts.asMap().keys.toList();

  String colorSelectableItem = "";
  String selectableFont = "Abel";
  Color selectable = Colors.blue;

  Map<String, Color> chosenColors = {
    "primary": Colors.blue,
    "accent": Colors.blue,
    "card": Colors.blue,
    "button": Colors.blue,
    "buttonText": Colors.blue,
    "error": Colors.blue,
    "brightness": Colors.white,
    "primaryContainer": Colors.blue,
    "divider": Colors.blue,
    "icon": Colors.blue,
    "radioFill": Colors.blue,
    "onPrimaryContainer": Colors.blue,
    "onPrimary": Colors.blue,
    "onSecondary": Colors.blue,
    "onError": Colors.blue,
    "hover": Colors.blue
  };
  Map<String, String> colorExplanation = {
    "primary":
        "It is the main color throughout the whole design style. Includes top banner, upload button, input field color",
    "accent": "Secondary color of the app",
    "card": "Color of the component Card",
    "button": "Button background color",
    "buttonText": "Button foreground color",
    "error": "Color of the error - unvalidated input",
    "brightness": "Light / Dark - depending on theme",
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
    "bodySmall": {
      "fontSize": TextEditingController(text: "10"),
      "fontWeight": 300
    },
    "bodyMedium": {
      "fontSize": TextEditingController(text: "20"),
      "fontWeight": 300
    },
    "bodyLarge": {
      "fontSize": TextEditingController(text: "30"),
      "fontWeight": 300
    },
    "displaySmall": {
      "fontSize": TextEditingController(text: "35"),
      "fontWeight": 300
    },
    "displayMedium": {
      "fontSize": TextEditingController(text: "46"),
      "fontWeight": 300
    },
    "displayLarge": {
      "fontSize": TextEditingController(text: "55"),
      "fontWeight": 300
    }
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

  TextEditingController buttonFontSizeController = TextEditingController();
  TextEditingController buttonPaddingController = TextEditingController();

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
    return !isPreviewPageShown
        ? SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    "Colors",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Setup colors: "),
                    DropdownButton(
                        value: colorSelectableItem,
                        items: colors
                            .map((color) => DropdownMenuItem(
                                  child: Row(
                                    children: [
                                      Container(
                                          width: 10,
                                          height: 10,
                                          color: color != ""
                                              ? chosenColors[color]
                                              : Colors.blue),
                                      SizedBox(width: 10),
                                      Text(color),
                                    ],
                                  ),
                                  value: color,
                                ))
                            .toList(),
                        onChanged: (item) => {
                              setState(() => {colorSelectableItem = item!}),
                              showDialog(
                                  context: context,
                                  builder: (builder) {
                                    return AlertDialog(
                                        actions: [],
                                        title: Row(children: [
                                          Text("Color: $item"),
                                          Spacer(),
                                          IconButton(
                                            icon: Icon(Icons.close_outlined),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                          ),
                                        ]),
                                        content: Column(children: [
                                          SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16, right: 16),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ColorPicker(
                                                          colorPickerWidth: 100,
                                                          pickerColor:
                                                              chosenColors[
                                                                  item]!,
                                                          onColorChanged:
                                                              (color) => {
                                                                    selectable =
                                                                        color
                                                                  }),
                                                      SizedBox(width: 100),
                                                      SizedBox(
                                                          width: 100,
                                                          child: Text(
                                                              colorExplanation[
                                                                      item]
                                                                  .toString())),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 200),
                                                ElevatedButton(
                                                    onPressed: () => {
                                                          setState(() => {
                                                                chosenColors[
                                                                        item!] =
                                                                    selectable
                                                              }),
                                                          Navigator.of(context)
                                                              .pop()
                                                        },
                                                    child: Text("Save"))
                                              ],
                                            ),
                                          ),
                                        ]));
                                  })
                            }),
                  ],
                ),
              ),
              Divider(),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Styles",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50, left: 50),
                    child: Text(
                      "Typography",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 50),
                        Text("Font family: "),
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
                    child: Text("Headlines, normal text ",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                    child: Center(
                      child: ExpansionPanelList(
                        expansionCallback: (panelIndex, isExpanded) => setState(
                            () => stylesExpanded[stylesExpanded.keys
                                .toList()[panelIndex]] = !isExpanded),
                        children: styles
                            .map((style) => ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (context, value) =>
                                    ListTile(title: Text(style)),
                                body: Column(
                                  children: [
                                    Text("This is: " +
                                        stylesExplanation[style]!),
                                    SizedBox(
                                        width: 200,
                                        child: TextField(
                                          controller: stylesValues[style]
                                              ["fontSize"],
                                          decoration: InputDecoration(
                                              labelText: "Enter here size: "),
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Is it bold ?"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Radio(
                                          groupValue: stylesValues[style]
                                              ["fontWeight"],
                                          onChanged: (e) => {
                                            print(e),
                                            setState(() => {
                                                  stylesValues[style]
                                                      ["fontWeight"] = 700
                                                })
                                          },
                                          value: 700,
                                        ),
                                        Text("YES"),
                                        Radio(
                                          groupValue: stylesValues[style]
                                              ["fontWeight"],
                                          onChanged: (e) => {
                                            print(e),
                                            setState(() => {
                                                  stylesValues[style]
                                                      ["fontWeight"] = 300
                                                })
                                          },
                                          value: 300,
                                        ),
                                        Text("NO"),
                                      ],
                                    )
                                  ],
                                ),
                                isExpanded: stylesExpanded[style]!))
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Buttons",
                              style: Theme.of(context).textTheme.displaySmall),
                          SizedBox(
                            width: 250,
                            child: Column(
                              children: [
                                TextField(
                                    keyboardType: TextInputType.number,
                                    controller: buttonFontSizeController,
                                    decoration: InputDecoration(
                                        labelText: "Enter here font size: ")),
                                TextField(
                                    keyboardType: TextInputType.number,
                                    controller: buttonPaddingController,
                                    decoration: InputDecoration(
                                        labelText:
                                            "Enter here inner size of a button: "))
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text("Input Fields",
                              style: Theme.of(context).textTheme.displaySmall),
                          SizedBox(height: 10),
                          Text("Outline border on Input fields"),
                          Row(
                            children: [
                              Radio(
                                groupValue: activeBorderForInputs,
                                onChanged: (e) => {
                                  setState(() => {activeBorderForInputs = e!})
                                },
                                value: true,
                              ),
                              Text("YES"),
                              Radio(
                                groupValue: activeBorderForInputs,
                                onChanged: (e) => {
                                  setState(() => {activeBorderForInputs = e!})
                                },
                                value: false,
                              ),
                              Text("NO"),
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
                          onPressed: () => {
                                setState(() => {isPreviewPageShown = true})
                              }),
                      SizedBox(width: 10),
                      ElevatedButton(
                          child: Text("Export JSON"),
                          onPressed: () => {exportJSON()}),
                    ],
                  )
                ],
              )
            ],
          ))
        : Preview(
            theme: ThemeData(
                primarySwatch: Colors.yellow,
                accentColor: chosenColors["accent"],
                cardColor: chosenColors["card"],
                hoverColor: chosenColors["hover"],
                radioTheme: RadioThemeData(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => chosenColors["radioFill"]!)),
                dividerColor: chosenColors["divider"],
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                  backgroundColor: chosenColors["button"],
                  foregroundColor: chosenColors["buttonText"],
                )),
                errorColor: chosenColors["error"],
                iconTheme: IconThemeData(color: chosenColors["icon"]),
                textTheme: GoogleFonts.getTextTheme(
                    selectableFont,
                    TextTheme(
                        bodyLarge: TextStyle(
                            fontSize: double.parse(
                                stylesValues["bodyLarge"]["fontSize"].text),
                            fontWeight: stylesValues["bodyLarge"]["fontWeight"] == 300
                                ? FontWeight.normal
                                : FontWeight.bold),
                        bodyMedium: TextStyle(
                            fontSize: double.parse(
                                stylesValues["bodyMedium"]["fontSize"].text),
                            fontWeight:
                                stylesValues["bodyMedium"]["fontWeight"] == 300
                                    ? FontWeight.normal
                                    : FontWeight.bold),
                        bodySmall: TextStyle(
                            fontSize: double.parse(stylesValues["bodySmall"]["fontSize"].text),
                            fontWeight: stylesValues["bodySmall"]["fontWeight"] == 300 ? FontWeight.normal : FontWeight.bold),
                        displayLarge: TextStyle(fontSize: double.parse(stylesValues["displayLarge"]["fontSize"].text), fontWeight: stylesValues["displayLarge"]["fontWeight"] == 300 ? FontWeight.normal : FontWeight.bold),
                        displayMedium: TextStyle(fontSize: double.parse(stylesValues["displayMedium"]["fontSize"].text), fontWeight: stylesValues["displayMedium"]["fontWeight"] == 300 ? FontWeight.normal : FontWeight.bold),
                        displaySmall: TextStyle(fontSize: double.parse(stylesValues["displaySmall"]["fontSize"].text), fontWeight: stylesValues["displaySmall"]["fontWeight"] == 300 ? FontWeight.normal : FontWeight.bold)))),
          );
  }

  void exportJSON() async {
    Map<String, dynamic> json = {};
    json["Colors"] = chosenColors
        .map((key, value) => MapEntry(key, HexColor(value.value).toHex()));
    json["Fonts"] = {};
    json["Fonts"]["textTheme"] = selectableFont;
    json["Fonts"]["buttonFontSize"] = buttonFontSizeController.text;
    json["Fonts"]["buttonPadding"] = buttonPaddingController.text;

    styles.forEach((style) {
      if (style != null) {
        json["Fonts"][style] = {};
        json["Fonts"][style]["fontSize"] = stylesValues[style]["fontSize"].text;
        json["Fonts"][style]["fontWeight"] = stylesValues[style]["fontWeight"];
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
