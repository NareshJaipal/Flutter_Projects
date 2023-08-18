import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool darkmode = false;
  String result = '0';
  String fullResult = '';

  void handleNumberButton(String value) {
    value = value.replaceAll('x', '*');
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
      if (!result.contains('.')) {
        setState(
          () {
            if (result == '0') {
              result = '0$value';
            } else {
              result += value;
            }
            fullResult = result;
          },
        );
      }
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
        color: darkmode ? Colors.black87 : Colors.white10,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Switch(
                        trackColor:
                            const MaterialStatePropertyAll(Colors.black38),
                        thumbColor:
                            const MaterialStatePropertyAll(Colors.white),
                        activeThumbImage: const NetworkImage(
                            'https://cdn4.iconfinder.com/data/icons/music-ui-solid-24px/24/moon_dark_mode_night-2-256.png'),
                        inactiveThumbImage: const NetworkImage(
                            'https://cdn2.iconfinder.com/data/icons/bubble-set-general/48/Sun-1024.png'),
                        value: darkmode,
                        onChanged: (value) => setState(() {
                          darkmode = !darkmode;
                        }),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                                color: darkmode ? Colors.white : Colors.blue),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            fullResult,
                            style: TextStyle(
                                color: darkmode ? Colors.grey : Colors.black),
                          ),
                        ),
                      ],
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
                        myButton('C', darkmode ? Colors.grey : Colors.blue),
                        myButton('D', darkmode ? Colors.grey : Colors.blue),
                        myButton('%', darkmode ? Colors.grey : Colors.blue),
                        myButton('/', darkmode ? Colors.grey : Colors.blue),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myButton('7', darkmode ? Colors.white : Colors.black),
                        myButton('8', darkmode ? Colors.white : Colors.black),
                        myButton('9', darkmode ? Colors.white : Colors.black),
                        myButton('x', darkmode ? Colors.grey : Colors.blue),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myButton('4', darkmode ? Colors.white : Colors.black),
                        myButton('5', darkmode ? Colors.white : Colors.black),
                        myButton('6', darkmode ? Colors.white : Colors.black),
                        myButton('-', darkmode ? Colors.grey : Colors.blue),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myButton('1', darkmode ? Colors.white : Colors.black),
                        myButton('2', darkmode ? Colors.white : Colors.black),
                        myButton('3', darkmode ? Colors.white : Colors.black),
                        myButton('+', darkmode ? Colors.grey : Colors.blue),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        myButton('0', darkmode ? Colors.white : Colors.black),
                        myButton('.', darkmode ? Colors.white : Colors.black),
                        myButton('        =        ',
                            darkmode ? Colors.grey : Colors.blue),
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
        backgroundColor: darkmode ? Colors.black : Colors.white,
        shadowColor: darkmode ? Colors.white : Colors.black,
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
