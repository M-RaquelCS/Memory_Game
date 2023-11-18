import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle title =
      GoogleFonts.luckiestGuy(color: AppColors.white, fontSize: 40);

  static final TextStyle titleGreen =
      GoogleFonts.luckiestGuy(color: AppColors.green, fontSize: 44);

  static final TextStyle heading = GoogleFonts.luckiestGuy(fontSize: 18);

  static final TextStyle headingGreen =
      GoogleFonts.luckiestGuy(color: AppColors.green, fontSize: 18);

  static final TextStyle heading20 =
      GoogleFonts.luckiestGuy(color: AppColors.white, fontSize: 20);

  static final TextStyle heading15Green =
      GoogleFonts.luckiestGuy(color: AppColors.green, fontSize: 15);

  static final TextStyle body =
      GoogleFonts.luckiestGuy(color: AppColors.white, fontSize: 13);
}
