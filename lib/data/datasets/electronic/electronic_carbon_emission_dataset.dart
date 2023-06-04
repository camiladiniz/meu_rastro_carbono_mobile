//  0.527 kg CO2e/kWh
import 'computer_cores_dataset.dart';
import 'computer_gpus_dataset.dart';

const double electricityCarbonEmissionFactorPerkWh = 0.5; // fonte: https://ghgprotocol.org/sites/default/files/2023-03/Scope3_Calculation_Guidance_0%5B1%5D.pdf
const double solarCarbonEmissionFactorPerKg = 0;

// cellphone charge (https://www.epa.gov/energy/greenhouse-gases-equivalencies-calculator-calculations-and-references)
const double phoneBatteryConsumption24HourEnergyInWattHours = 14.46; // Watt-hours
const double maintenanceModePowerFactorInWatts = 0.13; // Watts

// Computer emission 
class ComputerCoreTypes {
  static String get cpu => 'CPU';
  static String get gpu => 'GPU';
  static String get ambos => 'Ambos';
}

class ComputerCoreTypesModel {
  final String model;
  final int tdp;
  final int coresNumber;
  final double tdpPerCore;
  final String source;

  ComputerCoreTypesModel(this.model, this.tdp, this.coresNumber, this.tdpPerCore, this.source);
}

class ComputerDataset {
  static List<ComputerCoreTypesModel> get computerCoreTypes => computerCoreTypesDataset;
  static List<ComputerCoreTypesModel> get computerGPUTypes => computerGPUTypesDataset;
  static double get defaultPUE => 1.67; // reference: https://journal.uptimeinstitute.com/is-pue-actually-going-up/
}

class BrazilCarbonEmission {
  static String get location => 'BR';
  static String get continentName => 'South America';
  static String get countryName => 'Brazil';
  static String get regionName => 'Any';
  static double get carbonIntensity => 61.7;
  static String get type => 'Country';
  static String get source => 'carbonfootprint (March 2022) and Climate Transparency (2021 Report) (data from 2020),';
  static String get comments => 'Emissions intensity of the power sector';
}

class ComputerReferenceValues {
  static double get memoryPower => 0.3725; // "in W/GB from http://dl.acm.org/citation.cfm?doid=3076113.3076117 and https://www.tomshardware.com/uk/reviews/intel-core-i7-5960x-haswell-e-cpu,3918-13.html"
  static double get passengerCarEUPerKm => 175; // in gCO2/km from http://www.sciencedirect.com/science/article/pii/S1352231018307295 and https://www.gov.uk/government/publications/greenhouse-gas-reporting-conversion-factors-2019
  static double get passengerCarUSPerKm => 251; // in gCO2/km from https://www.epa.gov/greenvehicles/greenhouse-gas-emissions-typical-passenger-vehicle
  static double get trainPerKm => 41; // in gCO2/km, but more like 5-37g, from https://www.gov.uk/government/publications/greenhouse-gas-reporting-conversion-factors-2020
  static double get flightEconomyPerKm => 171; // in gCO2/km, but more like 139-244g, from https://www.gov.uk/government/publications/greenhouse-gas-reporting-conversion-factors-2020
  static double get treeYear => 11000; // in gCO2/tree/year from http://www.sciencedirect.com/science/article/pii/S0269749101002640
  static double get flightNY_SF => 570000; // gCO2e from https://calculator.carbonfootprint.com/calculator.aspx?tab=3
  static double get flightPAR_LON => 50000; // gCO2e from https://calculator.carbonfootprint.com/calculator.aspx?tab=3
  static double get flightNYC_MEL => 2310000; // gCO2e from https://calculator.carbonfootprint.com/calculator.aspx?tab=3
  static double get streamingNetflixPerhour => 36; // gCO2 from https://www.carbonbrief.org/factcheck-what-is-the-carbon-footprint-of-streaming-video-on-netflix (update)
  static double get googleSearch => 10; // gCO2 from http://www.janavirgin.com/CO2/CO2GLE_about.html
  static double get treeMonth => 917; // gCO2 same source as treeYear
}

class ComputerEmissionModel {
  late final String coreType;
  late final String modelCPU;
  late final int coresCPU;
  late final double powerCPU;
  late final String modelGPU;
  late final double amountGPU;
  late final double powerGPU;
  late final int memory;
  late final double runTimeInHours;
  late final double runtime;
  late final double carbonIntensity;
  late final int pueUsed;
  late final double psfUsed;
  late final double carbonEmissionsInGrams;
  late final String carbonEmissionsUnit;
  late final double carbonEmissionCPU;
  late final double carbonEmissionGPU;
  late final double carbonEmissionCore;
  late final double carbonEmissionMemory;
  late final double energyNeeded;
  late final double powerNeeded;

  ComputerEmissionModel();
  
}

// Streaming emisison factors
const double streamingCarbonEmissionPerHourInKg = 0.015;

class LampEnergyInWatts {
  static double get incandescente => 40; // https://www.abilumi.org.br/tabela-de-equivalencia-abilumi-2020/
  static double get led => 7;
}