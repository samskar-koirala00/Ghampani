import 'package:Ghampani/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Ghampani());
}

class Ghampani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
      theme: ThemeData.dark(),
    );
  }
}
