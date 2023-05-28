class ElectronicSurveyPayload {
  late String userId;
  final DateTime consumptionDate;
  final double carbonEmissionInKgCO2e;
  final double cellphoneUsageInHours;
  final double computerTurnedOnInMinutes;
  final String computerCoreType;
  final int computerCoresAmount;
  final String computerCPUModel;
  final String computerGPUModel;
  final String computerAvailableMemory;
  final double streamingUsageInMinutes;
  final double lampsOperationTime;
  final String lampType;
  final double phoneCarbonEmissionInKgCO2e;
  final double computerCarbonEmissionInKgCO2e;
  final double streamingCarbonEmissionInKgCO2e;
  final double lampCarbonEmissionInKgCO2e;

  ElectronicSurveyPayload({
    required this.consumptionDate,
    required this.carbonEmissionInKgCO2e,
    required this.cellphoneUsageInHours,
    required this.computerTurnedOnInMinutes,
    required this.computerCoreType,
    required this.computerCoresAmount,
    required this.computerCPUModel,
    required this.computerGPUModel,
    required this.computerAvailableMemory,
    required this.streamingUsageInMinutes,
    required this.lampsOperationTime,
    required this.lampType,
    required this.phoneCarbonEmissionInKgCO2e,
    required this.computerCarbonEmissionInKgCO2e,
    required this.streamingCarbonEmissionInKgCO2e,
    required this.lampCarbonEmissionInKgCO2e,
  });

  factory ElectronicSurveyPayload.fromJson(Map<String, dynamic> json) =>
      ElectronicSurveyPayload(
        consumptionDate: json['consumptionDate'],
        carbonEmissionInKgCO2e: json['carbonEmissionInKgCO2e'],
        cellphoneUsageInHours: json['cellphoneUsageInHours'],
        computerTurnedOnInMinutes: json['computerTurnedOnInMinutes'],
        computerCoreType: json['computerCoreType'],
        computerCoresAmount: json['computerCoresAmount'],
        computerCPUModel: json['computerCPUModel'],
        computerGPUModel: json['computerGPUModel'],
        computerAvailableMemory: json['computerAvailableMemory'],
        streamingUsageInMinutes: json['streamingUsageInMinutes'],
        lampsOperationTime: json['lampsOperationTime'],
        lampType: json['lampType'],
        phoneCarbonEmissionInKgCO2e: json['phoneCarbonEmissionInKgCO2e'],
        computerCarbonEmissionInKgCO2e: json['computerCarbonEmissionInKgCO2e'],
        streamingCarbonEmissionInKgCO2e:
            json['streamingCarbonEmissionInKgCO2e'],
        lampCarbonEmissionInKgCO2e: json['lampCarbonEmissionInKgCO2e'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'consumptionDate': consumptionDate.toIso8601String(),
        'carbonEmissionInKgCO2e': carbonEmissionInKgCO2e,
        'cellphoneUsageInHours': cellphoneUsageInHours,
        'computerTurnedOnInMinutes': computerTurnedOnInMinutes,
        'computerCoreType': computerCoreType,
        'computerCoresAmount': computerCoresAmount,
        'computerCPUModel': computerCPUModel,
        'computerGPUModel': computerGPUModel,
        'computerAvailableMemory': computerAvailableMemory,
        'streamingUsageInMinutes': streamingUsageInMinutes,
        'lampsOperationTime': lampsOperationTime,
        'lampType': lampType,
        'phoneCarbonEmissionInKgCO2e': phoneCarbonEmissionInKgCO2e,
        'computerCarbonEmissionInKgCO2e': computerCarbonEmissionInKgCO2e,
        'streamingCarbonEmissionInKgCO2e': streamingCarbonEmissionInKgCO2e,
        'lampCarbonEmissionInKgCO2e': lampCarbonEmissionInKgCO2e,
      };
}
