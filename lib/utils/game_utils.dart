import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_game/core/app_images.dart';

class Game extends ChangeNotifier {
  int countTap = 0;
  List<int> turnedCards = [];
  List<int> matchedCards = [];

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
          matchedCards.addAll(turnedCards);
          turnedCards.clear();

          // Verificar se todas as cartas deram match
          if (matchedCards.length == cardsGameImg!.length) {
            print("foi tudo");
          }
        } else {
          countTap++;
          turnedCards.clear();
          notifyListeners();
        }
      }
    });
  }

  String getImageForCard(int index) {
    // Verificar se a carta está na lista de cartas que deram match
    return matchedCards.contains(index)
        ? (cardsGameImg != null && index < cardsGameImg!.length)
            ? cardsGameImg![index]
            : AppImages.hidden
        // Verificar se a carta está na lista de cartas que foram clicadas
        : turnedCards.contains(index)
            ? (cardsGameImg != null && index < cardsGameImg!.length)
                ? cardsGameImg![index]
                : AppImages.hidden
            : AppImages.hidden;
  }

  void resetTurnedCards() {
    turnedCards.clear();
    notifyListeners();
  }
}
