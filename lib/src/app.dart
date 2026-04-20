import 'package:flutter/material.dart';
import 'ui/screens/main_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpinQ',
      theme: ThemeData.dark(),
      home: const MainScreen(),
    );
  }
}
