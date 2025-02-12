import 'package:dino_proto/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

final appInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  floatingLabelBehavior: FloatingLabelBehavior.never,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(
      color: AppColors.blue,
      width: 0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: AppColors.yellow, width: 0),
  ),
);
