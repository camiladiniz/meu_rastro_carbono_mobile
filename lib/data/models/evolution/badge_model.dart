import 'package:flutter/material.dart';

class BadgeModel {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  BadgeModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.color
  });
}
