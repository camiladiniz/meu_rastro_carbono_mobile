import 'package:flutter/material.dart';

class NavigateItemModel {
  final String title;
  final IconData icon;
  final Function onTap;

  NavigateItemModel(this.title, this.icon, this.onTap);
}

class CardItemModel {
  final String title;
  final IconData icon;
  final String surveyName;
  final Color color;
  SurveyStatus status;

  CardItemModel(
      {required this.title,
      required this.icon,
      required this.surveyName,
      required this.color,
      required this.status});
}

enum SurveyStatus { pending, answered, loading }
