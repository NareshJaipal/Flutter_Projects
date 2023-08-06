import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() => runApp(const Calculator());

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      title: 'Calculator',
      home: const HomeScreen(),
    );
  }
}
