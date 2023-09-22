import 'package:diceroll/dice_roller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Dice Roller')),
        body: const DiceRoller(),
      ),
    ),
  );
}
