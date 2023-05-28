import 'package:flutter/material.dart';
import 'package:meu_rastro_carbono/data/models/evolution/badge_model.dart';
import 'package:meu_rastro_carbono/ui/pages/tips_page.dart';

import '../tips/user_tips_response.dart';

class UserRewardsResponse {
  final String title;
  final SurveyType type;
  final String description;

  const UserRewardsResponse({
    required this.title,
    required this.type,
    required this.description,
  });

  factory UserRewardsResponse.fromJson(Map<String, dynamic> json) {
    return UserRewardsResponse(
      title: json['title'],
      type: SurveyType.values[json['type']],
      description: json['description'],
    );
  }

  static IconData getIcon(SurveyType t) {
    switch (t) {
      case SurveyType.water:
        return Icons.water;
      case SurveyType.food:
        return Icons.food_bank;
      case SurveyType.electronics:
        return Icons.electrical_services;
      case SurveyType.locomotion:
        return Icons.directions_train;
      default:
        return Icons.workspace_premium;
    }
  }

  static MaterialColor getColor(SurveyType t) {
    switch (t) {
      case SurveyType.water:
        return Colors.blue;
      case SurveyType.food:
        return Colors.pink;
      case SurveyType.electronics:
        return Colors.indigo;
      case SurveyType.locomotion:
        return Colors.purple;
      default:
        return Colors.indigo;
    }
  }

  static List<UserRewardsResponse> fromList(List<dynamic> jsonList) {
    return jsonList.map((json) => UserRewardsResponse.fromJson(json)).toList();
  }

  static List<BadgeModel> toBadgeModel(List<UserRewardsResponse> list) {
    return list
        .map((i) => BadgeModel(
            title: i.title,
            icon: getIcon(i.type),
            color: getColor(i.type),
            description: i.description))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'type': type,
        'description': description,
      };
}
