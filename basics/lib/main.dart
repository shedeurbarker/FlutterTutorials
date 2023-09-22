import 'package:basics/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer([
          Color.fromARGB(255, 3, 10, 39),
          Color.fromARGB(255, 58, 76, 149),
        ]),
      ),
    ),
  );
}
