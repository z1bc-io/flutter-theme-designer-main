import 'package:flutter/material.dart';
import 'package:app/helper/breakpoints.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorsExpandable extends StatefulWidget {
  final BuildContext context;
  final Function(String, Color) onCallback;
  const ColorsExpandable(
      {super.key, required this.context, required this.onCallback});

  @override
  State<ColorsExpandable> createState() => _ColorsExpandableState();
}

class _ColorsExpandableState extends State<ColorsExpandable> {
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

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
          child: Column(children: [
        Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Text("Choose color for each setup: ")),
        SizedBox(height: 30),
        SingleChildScrollView(
          child: GridView.count(
            crossAxisCount:
                breakpointsSettings[Breakpoints.getCurrentDevice(context)]
                    ["colorsGridSize"],
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: MediaQuery.of(context).size.width /
                MediaQuery.of(context).size.height,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 40, right: 40),
            children: [
              for (var color in colors) ...[
                Card(
                  semanticContainer: true,
                  color: Colors.white,
                  shadowColor: Colors.grey[700],
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(color,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          SizedBox(height: 10),
                          Text(
                              colorExplanation[color] != null
                                  ? colorExplanation[color]!
                                  : "N/A",
                              style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () => {
                              showDialog(
                                  context: widget.context,
                                  builder: (builder) {
                                    return AlertDialog(
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () => {
                                                  setState(() => {
                                                        chosenColors[color!] =
                                                            selectable
                                                      }),
                                                  widget.onCallback(
                                                      color, selectable),
                                                  Navigator.of(widget.context)
                                                      .pop()
                                                },
                                            child: Text("Save"))
                                      ],
                                      title: Text("$color :: Pick a color:: ",
                                          style: TextStyle(fontSize: 16)),
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
                                              pickerColor: chosenColors[color]!,
                                              onColorChanged: (color) =>
                                                  {selectable = color}),
                                        ),
                                      )),
                                    );
                                  })
                            },
                            child: Container(
                                width: breakpointsSettings[
                                        Breakpoints.getCurrentDevice(context)]
                                    ["colorsPickerWidth"],
                                height: breakpointsSettings[
                                        Breakpoints.getCurrentDevice(context)]
                                    ["colorsPickerHeight"],
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
                  ),
                ),
              ]
            ],
          ),
        ),
      ])),
    );
  }
}
