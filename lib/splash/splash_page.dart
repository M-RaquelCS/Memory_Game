import 'package:flutter/material.dart';

import 'package:memory_game/core/core.dart';
import 'package:memory_game/splash/widget/progress_bar_widget.dart';
import 'package:memory_game/home/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (_) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      ),
    );
    return Scaffold(
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              Text(
                'Iniciando...',
                style: AppTextStyles.heading20,
              ),
              const SizedBox(
                height: 10,
              ),
              const ProgressBar()
            ],
          )),
    );
  }
}
