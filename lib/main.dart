import 'package:flutter/material.dart';
import 'themes/custom_theme/custom_Theme.dart';
import 'themes/pre_theme/pre_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Theme Designer',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
          textTheme: TextTheme(
            bodyLarge: TextStyle(fontSize: 20),
            bodyMedium: TextStyle(fontSize: 16),
            bodySmall: TextStyle(fontSize: 15),
            displayLarge: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 56),
            displayMedium: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 36),
            displaySmall: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white))),
      home: const MyHomePage(title: 'Flutter Theme Designer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> themeOptions = {
    "PRE": {"id": 1, "name": "Pre-designed theme", "steps": PreTheme()},
    "CUSTOM": {"id": 2, "name": "Customize each future", "steps": CustomTheme()}
  };
  int activeThemeOption = 2;
  String activeTheme = "";

  Widget mainApp() {
    return SelectionArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.black, width: 1))),
              child: Row(
                children: [
                  Text("Theme", style: TextStyle(color: Colors.green)),
                  SizedBox(
                    width: 5,
                  ),
                  Text("designer", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
          ),
          Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Choose option:",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 100,
                  ),
                  for (var element in themeOptions.entries) ...[
                    Container(
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            onChanged: (e) {
                              setState(() {
                                activeThemeOption = e;
                              });
                            },
                            groupValue: activeThemeOption,
                            value: element.value["id"],
                          ),
                          SizedBox(width: 50),
                          Text(
                            element.value["name"],
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => {
                      setState(() => {activeTheme = "Custom"})
                    },
                    child: Text("CONTINUE"),
                  )
                ]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: activeTheme != ""
            ? themeOptions.entries
                .firstWhere(
                    (element) => element.value["id"] == activeThemeOption)
                .value["steps"]
            : mainApp());
  }
}
