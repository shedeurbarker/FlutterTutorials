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
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 17, 85, 7),
          Color.fromARGB(255, 17, 85, 7),
        ],
      )),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/dice-$currentRoll.png", width: 200),
          const SizedBox(height: 30),
          OutlinedButton(
            onPressed: rollDice,
            style: OutlinedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 28),
              backgroundColor: const Color.fromARGB(255, 34, 133, 19),
              padding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: const Text(
              'Roll Dice',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                wordSpacing: 5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
