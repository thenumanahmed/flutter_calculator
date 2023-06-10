import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userInput = '';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            children: [
              // input and result
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        result.toString(),
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // keyboard buttons
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        MyButton(
                            title: 'AC',
                            color: const Color(0xffffa00a),
                            onPress: () {
                              userInput = '';
                              result = '';
                              setState(() {});
                            }),
                        MyButton(
                            title: '+/-',
                            color: const Color(0xffffa00a),
                            onPress: () {
                              userInput += '+/-';
                              setState(() {});
                            }),
                        MyButton(
                            title: '%',
                            color: const Color(0xffffa00a),
                            onPress: () {
                              userInput += '%';
                              setState(() {});
                            }),
                        MyButton(
                          title: '/',
                          onPress: () {
                            var lastChar = userInput[userInput.length - 1];
                            //remove the last operator
                            if (lastChar == '+' ||
                                lastChar == '-' ||
                                lastChar == 'x' ||
                                lastChar == '/') {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            }
                            userInput += '/';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '7',
                            onPress: () {
                              userInput += '7';
                              setState(() {});
                            }),
                        MyButton(
                            title: '8',
                            onPress: () {
                              userInput += '8';
                              setState(() {});
                            }),
                        MyButton(
                            title: '9',
                            onPress: () {
                              userInput += '9';
                              setState(() {});
                            }),
                        MyButton(
                          title: 'x',
                          onPress: () {
                            var lastChar = userInput[userInput.length - 1];
                            //remove the last operator
                            if (lastChar == '+' ||
                                lastChar == '-' ||
                                lastChar == 'x' ||
                                lastChar == '/') {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            }
                            userInput += 'x';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '4',
                            onPress: () {
                              userInput += '4';
                              setState(() {});
                            }),
                        MyButton(
                            title: '5',
                            onPress: () {
                              userInput += '5';
                              setState(() {});
                            }),
                        MyButton(
                            title: '6',
                            onPress: () {
                              userInput += '6';
                              setState(() {});
                            }),
                        MyButton(
                          title: '-',
                          onPress: () {
                            var lastChar = userInput[userInput.length - 1];
                            //remove the last operator
                            if (lastChar == '+' ||
                                lastChar == '-' ||
                                lastChar == 'x' ||
                                lastChar == '/') {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            }
                            userInput += '-';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '1',
                            onPress: () {
                              userInput += '1';
                              setState(() {});
                            }),
                        MyButton(
                            title: '2',
                            onPress: () {
                              userInput += '2';
                              setState(() {});
                            }),
                        MyButton(
                            title: '3',
                            onPress: () {
                              userInput += '3';
                              setState(() {});
                            }),
                        MyButton(
                          title: '+',
                          onPress: () {
                            var lastChar = userInput[userInput.length - 1];
                            //remove the last operator
                            if (lastChar == '+' ||
                                lastChar == '-' ||
                                lastChar == 'x' ||
                                lastChar == '/') {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            }
                            userInput += '+';
                            setState(() {});
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(
                            title: '0',
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            }),
                        MyButton(
                            title: '.',
                            onPress: () {
                              userInput += '.';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'DEL',
                            onPress: () {
                              //to remove the last char
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            }),
                        MyButton(
                          title: '=',
                          onPress: () {
                            if (userInput != '') {
                              equalPress();
                              setState(() {});
                            } else {
                              result = '';
                              setState(() {});
                            }
                          },
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, contextModel);

    result = eval.toString();
  }
}
