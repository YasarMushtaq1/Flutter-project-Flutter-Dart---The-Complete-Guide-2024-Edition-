import 'package:flutter/material.dart';
import 'gradient_container.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          gradientColors: [Color.fromARGB(255, 37, 3, 95), Colors.deepPurple],
          // GradientContainer.purple();
          // usage of alternative constructor
        ),
      ),
    );
  }
}
