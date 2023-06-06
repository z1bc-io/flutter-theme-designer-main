import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class PreTheme extends StatefulWidget {
  const PreTheme({super.key});

  @override
  State<PreTheme> createState() => _PreThemeState();
}

class _PreThemeState extends State<PreTheme> {
  @override
  Widget build(BuildContext context) {
    return const Text("This is pre theme");
  }
}
