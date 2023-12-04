// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:memory_game/game/widgets/AppBar/game_app_bar_widget.dart';
import 'package:memory_game/utils/game_utils.dart';

class GamePage extends StatefulWidget {
  final int numberGame;
  int tries = 0;
  Game game = Game();

  GamePage({super.key, required this.numberGame}) {
    game.selectedLevel = numberGame;
  }

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();

    widget.game.generateImgCardsList(widget.numberGame);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const cardWidth = 100.0; // Largura desejada para cada card
    final crossAxisCount = (screenWidth / cardWidth).floor();

    return Scaffold(
      appBar: GameAppBar(game: widget.game),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: SizedBox(
                width: screenWidth,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.numberGame,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        widget.game.handleCardToTurnTap(index);
                        setState(() {
                          if (widget.game.turnedCards.length == 2) {
                            widget.game.checkMatch(context);

                            // Atraso de 1 segundo antes de resetar as cartas viradas
                            Future.delayed(const Duration(seconds: 1), () {
                              widget.game.resetTurnedCards();
                              setState(() {});
                            });
                          }
                        });
                      },
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          widget.game.getImageForCard(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
