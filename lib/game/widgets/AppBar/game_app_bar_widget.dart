// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:memory_game/core/core.dart';
import 'package:memory_game/utils/game_utils.dart';

class GameAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Game game;

  const GameAppBar({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        AppImages.eng,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.touch_app,
                size: 28,
              ),
              Text(
                '${game.countTap}',
                style: AppTextStyles.heading20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
