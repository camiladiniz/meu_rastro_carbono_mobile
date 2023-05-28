import 'package:meu_rastro_carbono/data/datasets/transport/transportation_carbon_emission_dataset.dart';

class LocomotionSurveyPayload {
  late String userId;
  late DateTime consumptionDate;
  late double carbonEmissionInKgCO2e;
  late double distanceInKm;
  late TransportationTypes transportType;
  late String? motorcycleFuel;
  late String? motorCycleMotor;
  late String? carFuel;
  late String? carMotor;
  late String? carElectricFuel;
  late String? carHybridFuel;
  late double? carHybridAutonomy;

  LocomotionSurveyPayload({
    required this.consumptionDate,
    required this.carbonEmissionInKgCO2e,
    required this.distanceInKm,
    required this.transportType,
    required this.motorcycleFuel,
    required this.motorCycleMotor,
    required this.carFuel,
    required this.carMotor,
    required this.carElectricFuel,
    required this.carHybridFuel,
    required this.carHybridAutonomy,
  });

  factory LocomotionSurveyPayload.fromJson(Map<String, dynamic> json) =>
      LocomotionSurveyPayload(
        consumptionDate: json['consumptionDate'],
        carbonEmissionInKgCO2e: json['carbonEmissionInKgCO2e'],
        distanceInKm: json['distanceInKm'],
        transportType: json['transportType'],
        motorcycleFuel: json['motorcycleFuel'],
        motorCycleMotor: json['motorCycleMotor'],
        carFuel: json['carFuel'],
        carMotor: json['carMotor'],
        carElectricFuel: json['carElectricFuel'],
        carHybridFuel: json['carHybridFuel'],
        carHybridAutonomy: json['carHybridAutonomy'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'consumptionDate': consumptionDate.toIso8601String(),
        'carbonEmissionInKgCO2e': carbonEmissionInKgCO2e,
        'distanceInKm': distanceInKm,
        'transportType': transportType.index,
        'motorcycleFuel': motorcycleFuel,
        'motorCycleMotor': motorCycleMotor,
        'carFuel': carFuel,
        'carMotor': carMotor,
        'carElectricFuel': carElectricFuel,
        'carHybridFuel': carHybridFuel,
        'carHybridAutonomy': carHybridAutonomy,
      };
}
