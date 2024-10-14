import 'package:flutter/material.dart';

final AppTextStyles text = AppTextStyles();

class AppTextStyles {
  TextStyle get title => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  TextStyle get subtitle => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  TextStyle get body => const TextStyle(
        fontSize: 14,
      );
}
