import 'package:flutter/material.dart';
import 'package:memory_game/core/core.dart';

class RowRecord extends StatelessWidget {
  final int level;
  final int plays;

  const RowRecord({super.key, required this.level, required this.plays});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray700,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Nível $level",
            style: AppTextStyles.headingWhite,
          ),
          Text("$plays jogadas", style: AppTextStyles.headingWhite)
        ],
      ),
    );
  }
}
