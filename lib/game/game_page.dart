import 'package:flutter/material.dart';
import 'package:memory_game/core/app_text_styles.dart';
import 'package:memory_game/game/widgets/AppBar/game_app_bar_widget.dart';

class GamePage extends StatefulWidget {
  final int numberGame;
  const GamePage({super.key, required this.numberGame});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GameAppBar(),
      body: Center(
          child: Text(
        '${widget.numberGame}',
        style: AppTextStyles.headingWhite,
      )),
    );
  }
}
