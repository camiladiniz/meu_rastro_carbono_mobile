import 'package:flutter/material.dart';

class UserMetricsModel {
  final String metricName;
  final String useDescription;
  final String emission;
  final IconData icon;

  UserMetricsModel({
    required this.metricName,
    required this.useDescription,
    required this.emission,
    required this.icon,
  });
}
