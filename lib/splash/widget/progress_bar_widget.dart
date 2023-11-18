import 'package:flutter/material.dart';
import 'package:memory_game/core/core.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1750),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    // Inicia a animação quando o widget é construído
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          width: 250,
          child: LinearProgressIndicator(
            value: _animation.value,
            backgroundColor: AppColors.gray800,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
            minHeight: 6,
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
