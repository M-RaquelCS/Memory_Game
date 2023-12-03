import 'package:flutter/material.dart';
import 'package:memory_game/game/game_page.dart';
import 'package:memory_game/levels/widgets/LevelButton/level_button_widget.dart';
import 'package:memory_game/widgets/AppBar/app_bar_widget.dart';

class ListLevelsPage extends StatefulWidget {
  final String title;
  final List<int> numbers = [6, 8, 10, 12, 16, 18, 20, 22];

  ListLevelsPage({super.key, required this.title});

  @override
  State<ListLevelsPage> createState() => _ListLevelsPageState();
}

class _ListLevelsPageState extends State<ListLevelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: widget.title,
          onBack: () {
            // Lógica para voltar à página anterior
            Navigator.of(context).pop();
          },
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8, // espaço horizontal entre os buttons
                    mainAxisSpacing: 16 // espaço vertical entre os buttons
                    ),
                itemCount: widget.numbers.length,
                itemBuilder: (context, index) {
                  return LevelButton(
                    number: widget.numbers[index],
                    action: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GamePage(numberGame: widget.numbers[index]),
                          ));
                    },
                  );
                },
              ),
            ),
          ),
        ));
  }
}
