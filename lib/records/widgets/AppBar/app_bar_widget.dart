import 'package:flutter/material.dart';
import 'package:memory_game/core/core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBack;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.heading20,
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.keyboard_arrow_left,
          size: 38,
        ),
        onPressed: onBack,
      ),
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
