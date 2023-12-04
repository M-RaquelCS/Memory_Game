import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_game/core/app_images.dart';

class Game extends ChangeNotifier {
  int countTap = 0;
  List<int> turnedCards = [];

  List<String>? cardsGameImg;

  List<String> cardsImgList = [
    AppImages.one,
    AppImages.two,
    AppImages.three,
    AppImages.four,
    AppImages.five,
    AppImages.six,
    AppImages.seven,
    AppImages.eight,
    AppImages.nine,
    AppImages.ten,
    AppImages.eleven,
  ];

  void generateImgCardsList(int numberOfCards) {
    if (numberOfCards % 2 != 0) {
      throw Exception("O número de cartas deve ser par.");
    }

    List<String> selectedImgsForCards = List.generate(numberOfCards ~/ 2,
        (index) => cardsImgList[index % cardsImgList.length]);

    List<String> duplicatedImgsForCards = [
      ...selectedImgsForCards,
      ...selectedImgsForCards
    ];

    duplicatedImgsForCards.shuffle();

    cardsGameImg = duplicatedImgsForCards;
  }

  void handleCardToTurnTap(int index) {
    if (!turnedCards.contains(index) && turnedCards.length < 2) {
      turnedCards.add(index);
      notifyListeners();
    }

    print(turnedCards);

    if (turnedCards.length == 2) {
      checkMatch();
    }
  }

  void checkMatch() {
    Timer(const Duration(seconds: 1), () {
      // verificar se o jogo já começou (a lista de images geradas) e se já tem alguma selecionada.
      if (cardsGameImg != null &&
          cardsGameImg!.isNotEmpty &&
          turnedCards.isNotEmpty &&
          turnedCards.length == 2) {
        if (cardsGameImg![turnedCards[0]] == cardsGameImg![turnedCards[1]]) {
          countTap++;
          print("foi");
          turnedCards.clear();
        } else {
          countTap++;
          turnedCards.clear();
          notifyListeners();
        }
      }
    });
  }
}
