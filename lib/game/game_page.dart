// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:memory_game/core/app_images.dart';
import 'package:memory_game/core/core.dart';
import 'package:memory_game/game/widgets/AppBar/game_app_bar_widget.dart';
import 'package:memory_game/utils/game_utils.dart';

class GamePage extends StatefulWidget {
  final int numberGame;
  int tries = 0;
  Game game = Game();

  GamePage({super.key, required this.numberGame});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();

    // Chamando a função para inicializar o jogo com o número de cartas desejado
    widget.game.generateImgCardsList(widget.numberGame);
    print(widget.game.cardsGameImg);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const cardWidth = 100.0; // Largura desejada para cada card
    final crossAxisCount = (screenWidth / cardWidth).floor();

    return Scaffold(
      appBar: const GameAppBar(),
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
                          widget.game.turnedCards.contains(index)
                              ? (widget.game.cardsGameImg != null &&
                                      index < widget.game.cardsGameImg!.length)
                                  ? widget.game.cardsGameImg![index]
                                  : AppImages.hidden
                              : AppImages.hidden;
                        });
                      },
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(
                          widget.game.turnedCards.contains(index)
                              ? (widget.game.cardsGameImg != null &&
                                      index < widget.game.cardsGameImg!.length)
                                  ? widget.game.cardsGameImg![index]
                                  : AppImages.hidden
                              : AppImages.hidden,
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
