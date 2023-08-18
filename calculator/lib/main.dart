import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() => runApp(const Calculator());

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme:
      //     darkmode ? ThemeData(primarySwatch: Colors.grey) : ThemeData.dark(),
      title: 'Calculator',
      home: HomeScreen(),
    );
  }
}
