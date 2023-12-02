import 'package:flutter/material.dart';
import 'package:memory_game/core/app_text_styles.dart';
import 'package:memory_game/core/core.dart';

class RecordButton extends StatelessWidget {
  final String title;
  final Function action;

  const RecordButton({
    super.key,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => action(),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.gray700,
        elevation: 0,
        padding: EdgeInsets.zero,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
