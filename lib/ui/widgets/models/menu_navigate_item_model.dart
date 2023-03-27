import 'package:flutter/material.dart';

class NavigateItemModel {
  final String title;
  final IconData icon;
  final Function onTap;

  NavigateItemModel(this.title, this.icon, this.onTap);
}

class CardItemModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function onTap;
  final Color color;
  final SurveyStatus status;

  CardItemModel(
      {required this.title,
      required this.subtitle,
      required this.icon,
      required this.onTap,
      required this.color,
      required this.status});
}

enum SurveyStatus { pending, answered }
