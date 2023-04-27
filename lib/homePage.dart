import 'package:flutter/material.dart';

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
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(title: 'AC', onPress: () {}),
                        MyButton(title: '+/-', onPress: () {}),
                        MyButton(title: '%', onPress: () {}),
                        MyButton(
                          title: '/',
                          onPress: () {},
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '7', onPress: () {}),
                        MyButton(title: '8', onPress: () {}),
                        MyButton(title: '9', onPress: () {}),
                        MyButton(
                          title: 'x',
                          onPress: () {},
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '4', onPress: () {}),
                        MyButton(title: '5', onPress: () {}),
                        MyButton(title: '6', onPress: () {}),
                        MyButton(
                          title: '-',
                          onPress: () {},
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '1', onPress: () {}),
                        MyButton(title: '2', onPress: () {}),
                        MyButton(title: '3', onPress: () {}),
                        MyButton(
                          title: '+',
                          onPress: () {},
                          color: const Color(0xffffa00a),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButton(title: '0', onPress: () {}),
                        MyButton(title: '.', onPress: () {}),
                        MyButton(title: 'DEL', onPress: () {}),
                        MyButton(
                          title: '=',
                          onPress: () {},
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
}
