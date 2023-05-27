import 'package:flutter/material.dart';

class LevelModel {
  final String title;
  final String number;
  final String imagePath;
  final Color color;
  late bool isAvailable;
  late double userPontuation = 0;
  late double userPontuationPercentage = 0;
  late int pontuationToBeReached = 0;

  LevelModel({
    required this.title,
    required this.number,
    required this.imagePath,
    required this.color,
    required this.isAvailable,
  });
}
