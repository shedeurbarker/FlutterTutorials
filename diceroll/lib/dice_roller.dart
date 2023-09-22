import 'dart:math';

import 'package:flutter/material.dart';

var randomize = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentRoll = 1;
  void rollDice() {
    setState(() {
      currentRoll = randomize.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/dice-$currentRoll.png", width: 200),
          const SizedBox(height: 30),
          TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 28),
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.all(15)),
            child: const Text(
              'Roll Dice',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
