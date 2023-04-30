import 'package:flutter/material.dart';

import 'package:fastrent/app/data/utils/app_colors.dart';

class AppTextStyles {
  static const TextStyle logo = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold, // w500 adalah kode untuk medium
    fontSize: 40.0,
    color: Rcolors.primary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14.0,
    fontFamily: 'Poppins',
    color: Rcolors.onSurface,
  );

  static const TextStyle button = TextStyle(
    fontSize: 14.0,
    fontFamily: 'Poppins',
    color: Rcolors.background,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}
