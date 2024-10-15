import 'package:dino_proto/src/theme/app_colors.dart';
import 'package:dino_proto/src/theme/text.dart';
import 'package:flutter/material.dart';

const buttonHeight = 56.0;
final appElevatedButton = ElevatedButton.styleFrom(
  backgroundColor: AppColors.yellow,
  foregroundColor: AppColors.pink,
  textStyle: text.buttonTitle,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
);
