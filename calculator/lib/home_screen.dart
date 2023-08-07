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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        '0',
                        style: TextStyle(fontSize: 60, color: Colors.lightBlue),
                      ),
                    ),
                    const Text('Naresh'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myButton('C', Colors.blue),
                        myButton('D', Colors.blue),
                        myButton('%', Colors.blue),
                        myButton('/', Colors.blue),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myButton('7', Colors.black),
                        myButton('8', Colors.black),
                        myButton('9', Colors.black),
                        myButton('X', Colors.blue),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myButton('4', Colors.black),
                        myButton('5', Colors.black),
                        myButton('6', Colors.black),
                        myButton('-', Colors.blue),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myButton('1', Colors.black),
                        myButton('2', Colors.black),
                        myButton('3', Colors.black),
                        myButton('+', Colors.blue),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myButton('0', Colors.black),
                        myButton('.', Colors.black),
                        myButton('+/-', Colors.blue),
                        myButton('=', Colors.blue),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton myButton(String btnText, Color textColor) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 50,
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
            ),
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
