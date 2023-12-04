import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory_game/core/app_images.dart';
import 'package:memory_game/success/success_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Game extends ChangeNotifier {
  int countTap = 0;
  int totalTaps = 0;
  int selectedLevel = 0;

  List<int> turnedCards = [];
  List<int> matchedCards = [];

  final List<int> numbers = [6, 8, 10, 12, 16, 18, 20, 22];

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

  void checkMatch(BuildContext context) {
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
            totalTaps = countTap;

            savePlaysForLevel(selectedLevel, countTap);
            saveData();

            print("foi tudo");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SuccessPage(),
              ),
            );
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

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('selectedLevel', selectedLevel);
    prefs.setInt('totalTaps', totalTaps);
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedLevel = prefs.getInt('selectedLevel') ?? 0;
    totalTaps = prefs.getInt('totalTaps') ?? 0;
  }

  // Método para obter o número de jogadas associadas a um nível
  Future<int> getPlaysForLevel(int level) async {
    // Use o operador await para esperar a conclusão do Future
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('playsForLevel$level') ?? 0;
  }

  Future<void> savePlaysForLevel(int level, int plays) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('playsForLevel$level', plays);
  }
}
