import 'package:flutter/material.dart';
import 'pages/themes/custom_theme/custom_Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Theme Designer',
        // theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.blue,
        // textTheme: TextTheme(
        //   bodyLarge: TextStyle(fontSize: 20),
        //   bodyMedium: TextStyle(fontSize: 16),
        //   bodySmall: TextStyle(fontSize: 15),
        //   displayLarge: TextStyle(
        //       color: Colors.black,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 56),
        //   displayMedium: TextStyle(
        //       color: Colors.black,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 36),
        //   displaySmall: TextStyle(
        //       color: Colors.black,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 26),
        // ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.blue,
        //         foregroundColor: Colors.white))),
        home: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTheme(),
            ],
          ),
        )));
  }
}
