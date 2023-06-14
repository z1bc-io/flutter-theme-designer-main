import 'package:flutter/material.dart';

class Preview extends StatefulWidget {
  final ThemeData? theme;
  const Preview({super.key, this.theme});

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
          appBar: AppBar(centerTitle: true, title: Text("Preview Styles")),
          body: previewApp(context, widget.theme!),
        ));
  }
}

Widget previewApp(BuildContext context, ThemeData theme) {
  return SingleChildScrollView(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
          child: Text("Display Large (title) - style",
              style: theme.textTheme.displayLarge)),
      const SizedBox(height: 100),
      Text("Display Medium - subtitle style",
          style: theme.textTheme.displayMedium),
      const SizedBox(
        height: 100,
      ),
      Text(
          "Some paragraph text .... (large) - largest paragraph text...Some paragraph text .... (bodyLarge) - largest paragraph text",
          style: theme.textTheme.bodyLarge),
      const SizedBox(height: 70),
      Text("Display small - subtitle of a subtitle style",
          style: theme.textTheme.displaySmall),
      const SizedBox(height: 70),
      Text(
          "Some paragraph text .... (medium) - medium paragraph text...Some paragraph text .... (medium) - medium paragraph text",
          style: theme.textTheme.bodyMedium),
      const SizedBox(height: 70),
      Text(
          "Some paragraph text .... (small) - small paragraph text...Some paragraph text .... (small) - small paragraph text",
          style: theme.textTheme.bodySmall),
      Container(
        width: 250,
        height: 250,
        color: theme.cardColor,
      )
    ],
  ));
}
