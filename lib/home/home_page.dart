import 'package:flutter/material.dart';
import 'package:memory_game/core/core.dart';
import 'package:memory_game/home/widgets/GameButton/game_button_widget.dart';
import 'package:memory_game/home/widgets/RecodButton/record_button_widget.dart';
import 'package:memory_game/levels/list_level_page.dart';
import 'package:memory_game/records/records_page.dart';
// import 'package:memory_game/home/widgets/GameButton/game_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo do Memoriam game
          Column(
            children: [
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -25,
                      left: 0,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppColors.darkGreen.withOpacity(0.3),
                              Colors.transparent,
                            ],
                            stops: const [0.01, 0.8],
                            center: Alignment.center,
                            radius: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -30,
                      right: -10,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppColors.darkRed.withOpacity(0.3),
                              Colors.transparent,
                            ],
                            stops: const [0.01, 0.8],
                            center: Alignment.center,
                            radius: 1.0,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.asset(
                          AppImages.logo,
                          width: 140,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text("Memoriam", style: AppTextStyles.titleGreen),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Quem será o meste da memória?",
                style: AppTextStyles.heading20,
              )
            ],
          ),
          // Ações para iniciar o jogo
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GameButton(
                label: 'white',
                title: 'Iniciar jogo',
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ListLevelsPage(title: "Níveis Modo Normal"),
                      ));
                },
              ),
              GameButton(
                label: 'green',
                title: 'Iniciar jogo no modo IFPE',
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ListLevelsPage(title: "Níveis Modo IFPE"),
                      ));
                },
              )
            ],
          ),
          // Ações para acessar Recordes
          Container(
            height: 164,
            width: MediaQuery.of(context).size.width - 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.gray700,
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recordes",
                  style: AppTextStyles.headingGreen,
                ),
                RecordButton(
                    title: "Modo Normal",
                    action: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RecordPage(title: "Recordes Modo Normal"),
                          ));
                    }),
                RecordButton(
                    title: "Modo IFPE",
                    action: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RecordPage(title: "Recordes Modo IFPE"),
                          ));
                    }),
              ],
            ),
          ),
          // Footer com as images do IFPE e Engenharia de Software
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.ifpe,
                height: 50,
              ),
              Image.asset(
                AppImages.eng,
                height: 60,
              ),
            ],
          )
        ],
      ),
    );
  }
}
