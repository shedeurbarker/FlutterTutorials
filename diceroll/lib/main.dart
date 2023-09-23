import 'package:diceroll/dice_roller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Dice Roller'),
            backgroundColor: const Color.fromARGB(255, 17, 85, 7)),
        body: const DiceRoller(),
      ),
    ),
  );
}
