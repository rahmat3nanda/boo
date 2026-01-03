import 'package:boo/app/main/main.page.dart' show MainPage;
import 'package:flutter/material.dart'
    show
        BuildContext,
        ColorScheme,
        Colors,
        MaterialApp,
        StatelessWidget,
        ThemeData,
        Widget;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const MainPage(),
  );
}
