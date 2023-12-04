import 'package:flutter/material.dart';
import 'package:memory_game/core/core.dart';
import 'package:memory_game/records/widgets/RowRecord/row_record_widget.dart';
import 'package:memory_game/utils/game_utils.dart';
import 'package:memory_game/widgets/AppBar/app_bar_widget.dart';

class RecordPage extends StatefulWidget {
  final String title;

  const RecordPage({super.key, required this.title});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  Game game = Game();
  late Future<List<Widget>> recordWidgets;

  @override
  void initState() {
    super.initState();
    recordWidgets = loadRecordWidgets();
  }

  Future<List<Widget>> loadRecordWidgets() async {
    // Garante que os dados estejam carregados antes de acessá-los
    await game.loadData();

    List<Widget> widgets = [];
    for (int level in game.numbers) {
      int plays = await game.getPlaysForLevel(level);

      widgets.add(RowRecord(
        level: level,
        plays: plays,
      ));
    }

    return widgets;
  }

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
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Recordes da última jogada",
                style: AppTextStyles.titleGreen,
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: FutureBuilder<List<Widget>>(
                  future: recordWidgets,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Erro: ${snapshot.error}");
                    } else {
                      return Column(
                        children: snapshot.data ?? [],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
