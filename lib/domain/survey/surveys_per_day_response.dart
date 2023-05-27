class SurveyPerDayResponse {
  final bool waterSurvey;
  final bool foodSurvey;
  final bool electronicSurvey;
  final bool locomotionSurvey;

  const SurveyPerDayResponse(
      {required this.waterSurvey, required this.foodSurvey, required this.electronicSurvey, required this.locomotionSurvey});

  factory SurveyPerDayResponse.fromJson(Map<String, dynamic> json) => SurveyPerDayResponse(
        waterSurvey: json['waterSurvey'],
        foodSurvey: json['foodSurvey'],
        electronicSurvey: json['electronicSurvey'],
        locomotionSurvey: json['locomotionSurvey'],
      );

  Map<String, dynamic> toJson() => {
        'waterSurvey': waterSurvey,
        'foodSurvey': foodSurvey,
        'electronicSurvey': electronicSurvey,
        'locomotionSurvey': locomotionSurvey,
      };
}
