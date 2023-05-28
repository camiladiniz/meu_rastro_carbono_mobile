import 'package:flutter/material.dart';
import 'package:meu_rastro_carbono/ui/pages/tips_page.dart';

enum SurveyType { water, food, electronics, locomotion }

class UserTipResponse {
  final String title;
  final SurveyType type;
  final String description;

  const UserTipResponse({
    required this.title,
    required this.type,
    required this.description,
  });

  factory UserTipResponse.fromJson(Map<String, dynamic> json) {
    return UserTipResponse(
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
        return Icons.co2;
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

  static List<UserTipResponse> fromList(List<dynamic> jsonList) {
    return jsonList.map((json) => UserTipResponse.fromJson(json)).toList();
  }

  static List<Tip> toTipModel(List<UserTipResponse> list) {
    return list
        .map((i) => Tip(
            title: i.title,
            subtitle: i.description,
            icon: getIcon(i.type),
            color: getColor(i.type)))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'type': type,
        'description': description,
      };
}
