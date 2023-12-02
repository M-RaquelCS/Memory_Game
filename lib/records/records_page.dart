import 'package:flutter/material.dart';
import 'package:memory_game/core/core.dart';
import 'package:memory_game/records/widgets/AppBar/app_bar_widget.dart';

class RecordPage extends StatefulWidget {
  final String title;

  const RecordPage({super.key, required this.title});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
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
                "Top Recordes",
                style: AppTextStyles.titleGreen,
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.gray700, // Cor de fundo
                        borderRadius:
                            BorderRadius.circular(10), // Bordas arredondadas
                      ),
                      padding: const EdgeInsets.all(16), // Espaçamento interno
                      margin: const EdgeInsets.only(
                          bottom: 8), // Espaçamento entre as Rows
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nível 8",
                            style: AppTextStyles.headingWhite,
                          ),
                          Text("6 jogadas", style: AppTextStyles.headingWhite)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.gray700, // Cor de fundo
                        borderRadius:
                            BorderRadius.circular(10), // Bordas arredondadas
                      ),
                      padding: const EdgeInsets.all(16), // Espaçamento interno
                      margin: const EdgeInsets.only(
                          bottom: 8), // Espaçamento entre as Rows
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nível 8",
                            style: AppTextStyles.headingWhite,
                          ),
                          Text("6 jogadas", style: AppTextStyles.headingWhite)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.gray700, // Cor de fundo
                        borderRadius:
                            BorderRadius.circular(10), // Bordas arredondadas
                      ),
                      padding: const EdgeInsets.all(16), // Espaçamento interno
                      margin: const EdgeInsets.only(
                          bottom: 8), // Espaçamento entre as Rows
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nível 8",
                            style: AppTextStyles.headingWhite,
                          ),
                          Text("6 jogadas", style: AppTextStyles.headingWhite)
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.gray700, // Cor de fundo
                        borderRadius:
                            BorderRadius.circular(10), // Bordas arredondadas
                      ),
                      padding: const EdgeInsets.all(16), // Espaçamento interno
                      margin: const EdgeInsets.only(
                          bottom: 8), // Espaçamento entre as Rows
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Nível 8",
                            style: AppTextStyles.headingWhite,
                          ),
                          Text("6 jogadas", style: AppTextStyles.headingWhite)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
