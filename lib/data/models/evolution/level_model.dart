import 'package:flutter/material.dart';

class LevelModel {
  final String title;
  final int pontuation;
  final String number;
  final String imagePath;
  final Color color;
  final bool isAvailable;

  LevelModel({
    required this.title,
    required this.pontuation,
    required this.number,
    required this.imagePath,
    required this.color,
    required this.isAvailable
  });
}
