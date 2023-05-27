class WaterSurveyPayload {
  late String userId;
  final DateTime consumptionDate;
  final int showersAmount;
  final int eachShowerDuration;
  final double carbonEmissionInKgCO2e;

  WaterSurveyPayload(
      {required this.consumptionDate,
      required this.showersAmount,
      required this.eachShowerDuration,
      required this.carbonEmissionInKgCO2e});

  factory WaterSurveyPayload.fromJson(Map<String, dynamic> json) =>
      WaterSurveyPayload(
        consumptionDate: json['consumptionDate'],
        showersAmount: json['showersAmount'],
        eachShowerDuration: json['eachShowerDuration'],
        carbonEmissionInKgCO2e: json['carbonEmissionInKgCO2e'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'consumptionDate': consumptionDate.toIso8601String(),
        'showersAmount': showersAmount,
        'eachShowerDuration': eachShowerDuration,
        'carbonEmissionInKgCO2e': carbonEmissionInKgCO2e,
      };
}
