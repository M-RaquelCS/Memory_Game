import 'package:flutter/material.dart';
import 'package:memory_game/core/core.dart';

import 'package:memory_game/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Memoriam: Quem será o meste da memória?",
      home: const SplashPage(),
      theme: ThemeData(scaffoldBackgroundColor: AppColors.gray900),
    );
  }
}
