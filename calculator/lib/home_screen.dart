import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = '0';
  String fullResult = '0';

  void handleNumberButton(String value) {
    value = value.replaceAll('X', '*');
    if (value == '        =        ') {
      try {
        Parser p = Parser();
        Expression exp = p.parse(result);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        setState(() {
          result = eval.toString();
          fullResult = result;
        });
      } catch (e) {
        setState(() {
          result = 'Error';
          fullResult = '';
        });
      }
    } else if (value == 'C') {
      setState(() {
        result = '0';
        fullResult = '';
      });
    } else if (value == 'D') {
      setState(() {
        if (result.length < 2) {
          result = '0';
          fullResult = '';
        } else {
          result = result.substring(0, result.length - 1);
          fullResult = result;
        }
      });
    } else if (value == '.') {
      setState(
        () {
          if (result == '0') {
            result = '0$value';
          } else {
            // result = result.substring(0, result.length - 1) + value;
            result = '$result$value';
          }
          fullResult = result;
        },
      );
    } else if ('+-*/'.contains(value)) {
      if ('+-*/'.contains(result.substring(result.length - 1))) {
        setState(() {
          result = result.substring(0, result.length - 1) + value;
        });
      } else {
        setState(() {
          if (result == '0') {
            result = value;
          } else {
            result += value;
          }
          fullResult = result;
        });
      }
    } else {
      setState(
        () {
          if (result == '0') {
            result = value;
          } else {
            result += value;
          }
          fullResult = result;
        },
      );
    }
  }

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
                    Container(),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        result,
                        style: TextStyle(
                            fontSize: result.length < 5
                                ? 60
                                : result.length < 8
                                    ? 50
                                    : result.length < 11
                                        ? 40
                                        : result.length < 15
                                            ? 30
                                            : 20,
                            color: Colors.lightBlue),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(fullResult),
                    ),
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
                        // myButton('+/-', Colors.blue),
                        myButton('        =        ', Colors.blue),
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
          child: btnText == 'D'
              ? Icon(
                  Icons.backspace_outlined,
                  color: textColor,
                  size: 18,
                )
              : Text(
                  btnText,
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                  ),
                ),
        ),
      ),
      onPressed: () {
        handleNumberButton(btnText);
      },
    );
  }
}
