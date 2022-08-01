import 'package:flutter/material.dart';

// Class holding all the global defaults of the app
class AppAssets {
  static AppColors colors = AppColors();
  static AppImages images = AppImages();

  static final inputDecoration = InputDecoration(
    border: const OutlineInputBorder(),
    focusColor: AppAssets.colors.secondary,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppAssets.colors.secondary, width: 2.0),
    ),
  );
}

class AppColors {
  Color primary = const Color(0xFF820B8A);
  Color secondary = const Color(0xFFF18F01);

  Color background = const Color(0xFF171717);
  Color backgroundHighlight = const Color(0xFF252525);

  Color white = const Color(0xFFFFFFFF);
}

class AppImages {
  String logo = 'assets/logo.png';
  String logoNoBg = 'assets/logo_transparent.png';
}
