import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String outputText;
  const StyledText(this.outputText, {super.key});
  // positional argument

  @override
  Widget build(BuildContext context) {
    return Text(
      outputText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}
