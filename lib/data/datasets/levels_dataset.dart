import 'package:flutter/material.dart';

import '../models/evolution/level_model.dart';

List<LevelModel> getLevels() {
  return [
    LevelModel(
        title: 'Preparando o solo',
        number: '1',
        imagePath: 'lib/ui/assets/images/leaf.png',
        color: Colors.blue[100]!,
        isAvailable: false),
    LevelModel(
        title: 'Plantando a sementinha',
        number: '2',
        imagePath: 'lib/ui/assets/images/leaf_03.png',
        color: Colors.orange[100]!,
        isAvailable: false),
    LevelModel(
        title: 'Regando as sementes',
        number: '3',
        imagePath: 'lib/ui/assets/images/leaf_02.png',
        color: Colors.teal[100]!,
        isAvailable: false),
    LevelModel(
        title: 'Adicionando adubo',
        number: '4',
        imagePath: 'lib/ui/assets/images/leaf_04.png',
        color: Colors.blue[100]!,
        isAvailable: false),
    LevelModel(
        title: 'Cuidando do brotinho',
        number: '5',
        imagePath: 'lib/ui/assets/images/leaf_05.png',
        color: Colors.blue[100]!,
        isAvailable: false),
  ];
}

double getLevelProgressInPercentage(
    int userPontuationPercentage, int pontuationToBeReached) {
  double percentage = (userPontuationPercentage / pontuationToBeReached);
  return percentage;
}
