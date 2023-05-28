class FoodSurveyPayload {
  late String userId;
  final DateTime consumptionDate;
  late double carbonEmissionInKgCO2e;
  late int mealPortionsAmount;
  late int mealsAmount;

  FoodSurveyPayload({
    required this.consumptionDate,
    required this.carbonEmissionInKgCO2e,
    required this.mealPortionsAmount,
    required this.mealsAmount,
  });

  factory FoodSurveyPayload.fromJson(Map<String, dynamic> json) =>
      FoodSurveyPayload(
        consumptionDate: json['consumptionDate'],
        carbonEmissionInKgCO2e: json['carbonEmissionInKgCO2e'],
        mealPortionsAmount: json['mealPortionsAmount'],
        mealsAmount: json['mealsAmount'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'consumptionDate': consumptionDate.toIso8601String(),
        'carbonEmissionInKgCO2e': carbonEmissionInKgCO2e,
        'mealPortionsAmount': mealPortionsAmount,
        'mealsAmount': mealsAmount,
      };
}
