import 'package:flutter/material.dart';

import '../../helper/hex_color.dart';

class Preview extends StatefulWidget {
  final ThemeData? theme;
  final String? font;
  final Color? onPrimary;
  final bool? activeBorderForInputs;
  const Preview(
      {super.key,
      this.theme,
      this.font,
      this.onPrimary,
      this.activeBorderForInputs});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Preview Page",
        theme: widget.theme,
        home: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text(
                  "Styles and Typography, Primary color sets up entire app (this bar color, input fields color outline border)")),
          body: previewApp(context, widget.theme!, widget.font!,
              widget.onPrimary!, widget.activeBorderForInputs!),
        ));
  }
}

Widget previewApp(BuildContext context, ThemeData theme, String font,
    Color onPrimary, bool activeBorderForInputs) {
  return SingleChildScrollView(
      child: SelectionArea(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Text("Display Large (title)",
                style: theme.textTheme.displayLarge)),
        const SizedBox(height: 100),
        Text("Display Medium - subtitle style",
            style: theme.textTheme.displayMedium),
        Divider(),
        Text(
            "Some paragraph text .... (bodyLarge) - largest paragraph text...Some paragraph text .... (bodyLarge) - largest paragraph text",
            style: theme.textTheme.bodyLarge),
        const SizedBox(height: 70),
        Divider(),
        Text("Display small - subtitle of a subtitle style",
            style: theme.textTheme.displaySmall),
        const SizedBox(height: 70),
        Divider(),
        Text(
            "Some paragraph text .... (bodyMedium) - medium paragraph text...Some paragraph text .... (bodyMedium) - medium paragraph text",
            style: theme.textTheme.bodyMedium),
        const SizedBox(height: 70),
        Text(
            "Some paragraph text .... (bodySmall) - small paragraph text...Some paragraph text .... (bodySmall) - small paragraph text",
            style: theme.textTheme.bodySmall),
        Divider(),
        Text("Here is divider(line under) shown with divider setted color:"),
        Divider(),
        SizedBox(
          height: 50,
        ),
        Text("Here is shown icon with color setted:"),
        Icon(Icons.arrow_circle_right_outlined),
        SizedBox(height: 50),
        Divider(),
        Text("Here is shown container(box) with card color"),
        Container(
          width: 250,
          height: 250,
          color: theme.cardColor,
          child: Text("ON PRIMARY CONTAINER COLOR",
              style: TextStyle(color: onPrimary)),
        ),
        Divider(),
        Text("Here is shown card (component) with card color"),
        Card(
          elevation: 50,
          shadowColor: Colors.black,
          child: SizedBox(
            width: 250,
            height: 250,
            child: Text(
              "On Primary Style is a default color style for the text based of theme bright or dark",
            ),
          ),
        ),
        Text("Font family is: $font"),
        Divider(),
        Text(
            "Current theme is BRIGHT one, so the background is white with a black color for the text (), change it to DARK for change"),
        Divider(),
        Text("SECONDARY COLOR",
            style: TextStyle(backgroundColor: theme.accentColor)),
        Divider(),
        Text("Outline border INPUT FIELD"),
        SizedBox(height: 50),
        Center(
          child: SizedBox(
            width: 350,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
        ),
        SizedBox(height: 50),
        Divider(),
        Text("Normal INPUT FIELD"),
        SizedBox(height: 100),
        Center(
          child: SizedBox(
            width: 350,
            child: TextField(
              decoration:
                  InputDecoration(labelText: "Normal Input without outline"),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Divider(),
        Text("Button style (button background, text color, font size)"),
        ElevatedButton(onPressed: () => {}, child: Text("BUTTON")),
        Divider(),
        Text("Radio color"),
        Radio(value: "YES", groupValue: "yes", onChanged: (e) => {}),
        Radio(
          value: "NO",
          groupValue: "yes",
          onChanged: (e) => {},
        ),
      ],
    ),
  ));
}
