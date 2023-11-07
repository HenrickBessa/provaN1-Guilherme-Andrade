// ignore_for_file: prefer_const_constructors

import 'state_machine.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiabetesHelper());
}

class DiabetesHelper extends StatelessWidget {
  const DiabetesHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 33, 33, 33),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: DiabetesHelperPage(),
          ),
        ),
      ),
    );
  }
}

class DiabetesHelperPage extends StatefulWidget {
  const DiabetesHelperPage({super.key});

  @override
  State<DiabetesHelperPage> createState() => _DiabetesHelperPageState();
}

class _DiabetesHelperPageState extends State<DiabetesHelperPage> {
  StateMachine stateMachine = StateMachine();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                stateMachine.getStateText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  stateMachine.checkChoice(true);
                });
              },
              child: Text(
                stateMachine.getChoice1(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Visibility(
              visible: stateMachine.getChoice2() != null,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    stateMachine.checkChoice(false);
                  });
                },
                child: Text(
                  stateMachine.getChoice2() ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
