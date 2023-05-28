convertDouble(dynamic value) {
  double? convertedValue;
  if (value is int) {
    convertedValue = value.toDouble();
  } else if (value is double) {
    convertedValue = value;
  }
  return convertedValue;
}

class UserMetricsResponse {
  final double? showersMedia;
  final double? showersEmissionByGPerCO2;
  final double? carDistanceTraveled;
  final double? carEmissionByGPerCO2;
  final double? foodEmissionByGPerCO2;
  final double? phoneInChargeInHours;
  final double? phoneEmissionByGPerCO2;
  final double? lampsEmissionByGPerCO2;
  final double? computerEmissionByGPerCO2;
  final double? computerTurnedOnInMinutes;
  final double? streamingEmissionByGPerCO2;
  final double? streamingTimeInHours;
  final double? totalCarbonEmissionsInG;
  final double? treesAmountToCompensate;
  final double? treesAmountToCompensateInAYear;
  final double? lampsOperationTimeInHours;

  const UserMetricsResponse({
    required this.showersMedia,
    required this.showersEmissionByGPerCO2,
    required this.carDistanceTraveled,
    required this.carEmissionByGPerCO2,
    required this.foodEmissionByGPerCO2,
    required this.phoneInChargeInHours,
    required this.phoneEmissionByGPerCO2,
    required this.lampsEmissionByGPerCO2,
    required this.computerEmissionByGPerCO2,
    required this.computerTurnedOnInMinutes,
    required this.streamingEmissionByGPerCO2,
    required this.streamingTimeInHours,
    required this.totalCarbonEmissionsInG,
    required this.treesAmountToCompensate,
    required this.treesAmountToCompensateInAYear,
    required this.lampsOperationTimeInHours,
  });

  factory UserMetricsResponse.fromJson(Map<String, dynamic> json) {
    return UserMetricsResponse(
      showersMedia: convertDouble(json['showersMedia']),
      showersEmissionByGPerCO2: convertDouble(json['showersEmissionByGPerCO2']),
      carDistanceTraveled: convertDouble(json['carDistanceTraveled']),
      carEmissionByGPerCO2: convertDouble(json['carEmissionByGPerCO2']),
      foodEmissionByGPerCO2: convertDouble(json['foodEmissionByGPerCO2']),
      phoneInChargeInHours: convertDouble(json['phoneInChargeInHours']),
      phoneEmissionByGPerCO2: convertDouble(json['phoneEmissionByGPerCO2']),
      lampsEmissionByGPerCO2: convertDouble(json['lampsEmissionByGPerCO2']),
      computerEmissionByGPerCO2:
          convertDouble(json['computerEmissionByGPerCO2']),
      streamingEmissionByGPerCO2:
          convertDouble(json['streamingEmissionByGPerCO2']),
      streamingTimeInHours: convertDouble(json['streamingTimeInHours']),
      totalCarbonEmissionsInG: convertDouble(json['totalCarbonEmissionsInG']),
      treesAmountToCompensate: convertDouble(json['treesAmountToCompensate']),
      treesAmountToCompensateInAYear:
          convertDouble(json['treesAmountToCompensateInAYear']),
      computerTurnedOnInMinutes:
          convertDouble(json['computerTurnedOnInMinutes']),
      lampsOperationTimeInHours:
          convertDouble(json['lampsOperationTimeInHours']),
    );
  }

  Map<String, dynamic> toJson() => {
        'showersMedia': showersMedia,
        'showersEmissionByGPerCO2': showersEmissionByGPerCO2,
        'carDistanceTraveled': carDistanceTraveled,
        'carEmissionByGPerCO2': carEmissionByGPerCO2,
        'foodEmissionByGPerCO2': foodEmissionByGPerCO2,
        'phoneInChargeInHours': phoneInChargeInHours,
        'phoneEmissionByGPerCO2': phoneEmissionByGPerCO2,
        'lampsEmissionByGPerCO2': lampsEmissionByGPerCO2,
        'computerEmissionByGPerCO2': computerEmissionByGPerCO2,
        'streamingEmissionByGPerCO2': streamingEmissionByGPerCO2,
        'streamingTimeInHours': streamingTimeInHours,
        'totalCarbonEmissionsInG': totalCarbonEmissionsInG,
        'treesAmountToCompensate': treesAmountToCompensate,
        'treesAmountToCompensateInAYear': treesAmountToCompensateInAYear,
        'computerTurnedOnInMinutes': computerTurnedOnInMinutes,
        'lampsOperationTimeInHours': lampsOperationTimeInHours,
      };
}
