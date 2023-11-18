import 'package:flutter/material.dart';
import 'package:memory_game/core/core.dart';

class GameButton extends StatelessWidget {
  final String label;
  final String title;
  final Function action;

  GameButton(
      {super.key,
      required this.label,
      required this.title,
      required this.action})
      : assert(['white', 'green'].contains(label));

  final gameButtonPropsConfig = {
    'white': {
      "borderColor": AppColors.white,
      "textColor": AppColors.white,
    },
    'green': {
      "borderColor": AppColors.green,
      "textColor": AppColors.green,
    }
  };

  Color get borderColor => gameButtonPropsConfig[label]!['borderColor']!;
  Color get textColor => gameButtonPropsConfig[label]!['textColor']!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: () => action(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Background transparente
          foregroundColor: textColor, // Cor do texto
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
            side: BorderSide(color: borderColor, width: 1),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        ),
        child: Text(
          title,
          style: AppTextStyles.heading,
        ),
      ),
    );
  }
}

// Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontSize: 20),
//             )
//           ],
//         ),
