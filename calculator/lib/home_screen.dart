import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          btnText: 'C',
                          btnColor: 'blue',
                          textColor: 'white',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String btnText;
  final String btnColor;
  final textColor;

  const MyButton({
    super.key,
    required this.btnText,
    required this.btnColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      child: Text(
        btnText,
        style: const TextStyle(fontSize: 35, color: textColor),
      ),
      onPressed: () {},
    );
  }
}
