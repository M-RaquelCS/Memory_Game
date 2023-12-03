import 'package:flutter/material.dart';
import 'package:memory_game/core/app_text_styles.dart';

class LevelButton extends StatelessWidget {
  final int number;
  final Function action;

  const LevelButton({super.key, required this.number, required this.action});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => action(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.white, width: 1)),
      ),
      child: Center(
        child: Text(
          '$number',
          style: AppTextStyles.headingWhite,
        ),
      ),
    );
  }
}
