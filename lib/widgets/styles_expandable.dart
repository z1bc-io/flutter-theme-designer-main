import 'package:flutter/material.dart';
import 'package:app/widgets/font_weight.dart';
import 'package:google_fonts/google_fonts.dart';

class StylesExpandable extends StatefulWidget {
  final Map<String, Color> chosenColors;
  final Function(String, Map<String, dynamic>, dynamic) setDynamicValues;
  String themeSelectableItem;
  String selectableFont;
  List<String> styles;
  Map<String, dynamic> stylesValues;
  Map<String, String> stylesExplanation;
  StylesExpandable(
      {super.key,
      required this.chosenColors,
      required this.themeSelectableItem,
      required this.selectableFont,
      required this.styles,
      required this.stylesValues,
      required this.stylesExplanation,
      required this.setDynamicValues});

  @override
  State<StylesExpandable> createState() => _StylesExpandableState();
}

class _StylesExpandableState extends State<StylesExpandable> {
  double weight = 0, changeableWeight = 700;
  List<String> fonts = GoogleFonts.asMap().keys.toList();

  double buttonFontSize = 18;
  double buttonPadding = 20;
  int fontWeightActive = 300;
  bool activeBorderForInputs = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Theme: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Radio(
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return widget.chosenColors["radioFill"]!;
                        }),
                        groupValue: widget.themeSelectableItem,
                        onChanged: (e) => {
                          setState(() => {
                                widget.themeSelectableItem = e!,
                                widget.setDynamicValues(
                                    "themeSelectableItem", {}, e)
                              })
                        },
                        value: "Bright",
                      ),
                      Icon(Icons.light_mode,
                          color: widget.chosenColors["icon"]),
                      Radio(
                        fillColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return widget.chosenColors["radioFill"]!;
                        }),
                        groupValue: widget.themeSelectableItem,
                        onChanged: (e) => {
                          setState(() => {
                                widget.themeSelectableItem = e!,
                                widget.setDynamicValues(
                                    "themeSelectableItem", {}, e)
                              })
                        },
                        value: "Dark",
                      ),
                      Icon(Icons.mode_night,
                          color: widget.chosenColors["icon"]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 50),
        SizedBox(
          width: 300,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Typography: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Tooltip(
                        child: DropdownButton(
                            value: widget.selectableFont,
                            items: fonts
                                .map((font) => DropdownMenuItem(
                                      child: Text(font),
                                      value: font,
                                    ))
                                .toList(),
                            onChanged: (item) => {
                                  setState(() => {
                                        widget.selectableFont = item!,
                                        widget.setDynamicValues(
                                            "selectableFont", {}, item)
                                      })
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
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text("Setup headline, normal text: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                SizedBox(
                    width: 300,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.styles.length,
                        itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(widget.styles[index],
                                  style: TextStyle(
                                      fontSize: widget.stylesValues[
                                          widget.styles[index]]["fontSize"],
                                      fontWeight: widget.stylesValues[
                                                      widget.styles[index]]
                                                  ["fontWeight"] ==
                                              300
                                          ? FontWeight.w300
                                          : FontWeight.w700)),
                              Text(
                                  "${widget.stylesExplanation[widget.styles[index]]!} :${widget.stylesValues[widget.styles[index]]["fontSize"]}",
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 220,
                                    child: Slider(
                                      divisions: 9,
                                      min: 1,
                                      max: 100,
                                      label:
                                          "${widget.stylesValues[widget.styles[index]]["fontSize"]}",
                                      onChanged: (val) => {
                                        setState(() => {
                                              widget.stylesValues[
                                                      widget.styles[index]]
                                                  ["fontSize"] = val,
                                              widget.setDynamicValues(
                                                  "stylesValues",
                                                  {
                                                    "style":
                                                        widget.styles[index],
                                                    "property": "fontSize"
                                                  },
                                                  val)
                                            })
                                      },
                                      value: widget.stylesValues[
                                          widget.styles[index]]["fontSize"],
                                    ),
                                  ),
                                  CustomFontWeight(
                                      isSelected: widget.stylesValues[
                                                      widget.styles[index]]
                                                  ["fontWeight"] ==
                                              700
                                          ? true
                                          : false,
                                      callback: () => {
                                            weight = widget.stylesValues[widget
                                                .styles[index]]["fontWeight"],
                                            if (weight == 300)
                                              {
                                                changeableWeight = 700,
                                              }
                                            else
                                              {
                                                changeableWeight = 300,
                                              },
                                            setState(() => {
                                                  widget.stylesValues[widget
                                                              .styles[index]]
                                                          ["fontWeight"] =
                                                      changeableWeight,
                                                  widget.setDynamicValues(
                                                      "stylesValues",
                                                      {
                                                        "style": widget
                                                            .styles[index],
                                                        "property": "fontWeight"
                                                      },
                                                      changeableWeight)
                                                })
                                          }),
                                ],
                              )
                            ]),
                      ),
                    )),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Buttons",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              Text("Font size: ${buttonFontSize}",
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                              Slider(
                                onChanged: (value) => {
                                  setState(() => {
                                        buttonFontSize = value,
                                        widget.setDynamicValues(
                                            "buttonFontSize", {}, value)
                                      }),
                                },
                                min: 0,
                                max: 30,
                                label: "${buttonFontSize}",
                                divisions: 9,
                                value: buttonFontSize,
                              ),
                              Text("Button size: ${buttonPadding}",
                                  style:
                                      Theme.of(context).textTheme.labelLarge),
                              Slider(
                                onChanged: (value) => {
                                  setState(() => {
                                        buttonPadding = value,
                                        widget.setDynamicValues(
                                            "buttonPadding", {}, value)
                                      }),
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
                        SizedBox(height: 50),
                        Text("Input Fields: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                              groupValue: activeBorderForInputs,
                              onChanged: (e) => {
                                setState(() => {
                                      activeBorderForInputs = e!,
                                      widget.setDynamicValues(
                                          "activeBorderForInputs", {}, e)
                                    })
                              },
                              value: true,
                            ),
                            SizedBox(
                              width: 100,
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
                                setState(() => {
                                      activeBorderForInputs = e!,
                                      widget.setDynamicValues(
                                          "activeBorderForInputs", {}, e)
                                    })
                              },
                              value: false,
                            ),
                            SizedBox(
                              width: 100,
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
              ],
            ),
          ),
        )
      ]),
    );
  }
}
