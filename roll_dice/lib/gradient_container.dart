import 'package:flutter/material.dart';
import 'dice_roller.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  final List<Color> gradientColors;

  const GradientContainer({super.key, required this.gradientColors});
  // named argument

  // GradientContainer.purple({super.key}) : gradientColors = [];
  // an alternative constructor with predefined parameters

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: beginAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
