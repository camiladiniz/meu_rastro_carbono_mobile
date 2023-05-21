enum TransportationTypes {
  none,
  walking,
  bicycle,
  car,
  bus,
  travelBus,
  subway,
  motorcycle,
  train,
}

// Car fuels factors
const String defaultCarMotor1 = '1.0 a 1.5';
const String defaultCarMotor2 = '1.6 a 2.0';
const String defaultCarMotor3 = 'Maior que 2.0';

Map<String, double> etanolKgCOEmission = {
  defaultCarMotor1: 0.0014,
  defaultCarMotor2: 0.0019,
  defaultCarMotor3: 0.0029,
};

Map<String, double> gasolinaKgCOEmission = {
  defaultCarMotor1: 0.128,
  defaultCarMotor2: 0.169,
  defaultCarMotor3: 0.247,
};

Map<String, double> gnvKgCOEmission = {
  defaultCarMotor1: 0.137,
  defaultCarMotor2: 0.163,
  defaultCarMotor3: 0.235,
};

Map<String, double> dieselKgCOEmission = {
  defaultCarMotor1: 0.224,
  defaultCarMotor2: 0.224,
  defaultCarMotor3: 0.224,
};

// Electric car factors
class ElectricCarModels {
  static String get renaultZoe => 'Renault Zoe';
  static String get cherryArrizo5e => 'Cherry Arrizo 5e';
  static String get jACiEV40 => 'JAC iEV40';
  static String get nissanLeaf => 'Nissan Leaf';
  static String get bMWi3 => 'BMW i3';
  static String get chevroletBolt => 'Chevrolet Bolt';
  static String get jaguarIPace => 'Jaguar I-Pace';
  static String get outro => 'Outro';
}

// o calculo foi feito considerando (bateria/autonomia)*fator medio dos modelos de carro indicados
Map<String, double> carElectricKgCOPerModel = {
  ElectricCarModels.renaultZoe: 0.0103,
  ElectricCarModels.cherryArrizo5e: 0.0123,
  ElectricCarModels.jACiEV40: 0.0100,
  ElectricCarModels.nissanLeaf: 0.0077,
  ElectricCarModels.bMWi3: 0.0094,
  ElectricCarModels.chevroletBolt: 0.0119,
  ElectricCarModels.jaguarIPace: 0.0144,
  ElectricCarModels.outro: 0.0106,
};

// Collective transport Factors
class CollectiveTransport {
  static double get municipalBus => 0.088;
  static double get travelBus => 0.025;
  static double get subway => 0.004;
  static double get train => 0.0105;
}

// Motocycle fuels factors
// Car fuels factors
const String defaultMotocycleMotor1 = 'Até 125cc';
const String defaultMotocycleMotor2 = 'De 126cc a 250cc';
const String defaultMotocycleMotor3 = 'De 151cc em diante';

Map<String, double> motocyleEtanolKgCOEmission = {
  defaultMotocycleMotor1: 0.0007,
  defaultMotocycleMotor2: 0.0008,
  defaultMotocycleMotor3: 0.0011,
};

Map<String, double> motocyleGasolinaKgCOEmission = {
  defaultMotocycleMotor1: 0.060,
  defaultMotocycleMotor2: 0.068,
  defaultMotocycleMotor3: 0.094,
};

// Hybrid car factors
Map<String, double> hybridCarKgCOEmission = {
  'Gasolina': 1.69,
  'Diesel': 2.37,
  'Etanol': 0.013,
};