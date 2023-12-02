import 'package:flutter/material.dart';
import 'package:memory_game/widgets/AppBar/app_bar_widget.dart';

class ListLevelsPage extends StatefulWidget {
  final String title;

  const ListLevelsPage({super.key, required this.title});

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
      body: const Center(child: Text("oi")),
    );
  }
}
