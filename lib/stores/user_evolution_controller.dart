import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/data/models/metrics/user_metrics_model.dart';
import 'package:meu_rastro_carbono/infra/shared_preference_service.dart';
import 'package:mobx/mobx.dart';

import '../data/repositories/evolution_repository.dart';
import '../infra/shared_preference_constants.dart';
import '../ui/pages/tips_page.dart';
part 'user_evolution_controller.g.dart';

class UserEvolutionController = _UserEvolutionController
    with _$UserEvolutionController;

abstract class _UserEvolutionController extends Disposable with Store {
  final SharedPreferencesService localStorage =
      Modular.get<SharedPreferencesService>();
  final UserRevolutionRepository evolutionRepo =
      Modular.get<UserRevolutionRepository>();

  @observable
  List<UserMetricsModel> metrics = [];

  @observable
  String treesAmount = "-";

  @observable
  List<Tip> tips = [];

  _UserEvolutionController() {
    initializeSharedPreferences();
  }

  Future<void> initializeSharedPreferences() async {
    await localStorage.initializeSharedPreferences();
  }

  @action
  Future<int> getUserElovutionPoints() async {
    var userId =
        await localStorage.getStringValue(SharedPreferenceConstants.userId);
    return await evolutionRepo.getUserEvolutionPontuation(userId);
  }

  @action
  Future getUserTips() async {
    var userId =
        await localStorage.getStringValue(SharedPreferenceConstants.userId);

    var response = await evolutionRepo.getUserTips(userId);
    tips = response;
  }

  @action
  Future getUserMetrics() async {
    var userId =
        await localStorage.getStringValue(SharedPreferenceConstants.userId);

    var response = await evolutionRepo.getUserMetrics(userId);

    var number = response.treesAmountToCompensateInAYear?.toInt() ?? 0;

    treesAmount = int.parse(number.toString()).toString();

    List<UserMetricsModel> metricsTemp = [];
    metricsTemp.add(UserMetricsModel(
        metricName: 'Tempo no chuveiro',
        useDescription:
            '${response.showersMedia?.toInt()} min é média de duração',
        emission: '${response.showersEmissionByGPerCO2} gCO2e',
        icon: Icons.shower));
    metricsTemp.add(UserMetricsModel(
        metricName: 'Transporte privado',
        useDescription: 'Distância: ${response.carDistanceTraveled?.toInt()}km',
        emission: '${response.carEmissionByGPerCO2} gCO2e',
        icon: Icons.car_rental));
    metricsTemp.add(UserMetricsModel(
        metricName: 'Celular',
        useDescription:
            'Passou ${response.phoneInChargeInHours?.toInt()}h carregando',
        emission: '${response.carEmissionByGPerCO2} gCO2e',
        icon: Icons.battery_charging_full_rounded));
    metricsTemp.add(UserMetricsModel(
        metricName: 'Alimentação',
        useDescription: '',
        emission:
            '${response.foodEmissionByGPerCO2} gCO2e nas porções informadas',
        icon: Icons.food_bank));
    metricsTemp.add(UserMetricsModel(
        metricName: 'Lâmpadas',
        useDescription:
            'Ficaram ligadas por ${response.lampsOperationTimeInHours?.toInt()}h',
        emission: '${response.lampsEmissionByGPerCO2} gCO2e',
        icon: Icons.lightbulb));
    metricsTemp.add(UserMetricsModel(
        metricName: 'Computador',
        useDescription:
            'Utilizado por ${response.computerTurnedOnInMinutes?.toInt()} min',
        emission: '${response.computerEmissionByGPerCO2} gCO2e',
        icon: Icons.computer));
    metricsTemp.add(UserMetricsModel(
        metricName: 'Streaming',
        useDescription:
            'Assistiu por ${response.streamingTimeInHours?.toInt()}h',
        emission: '${response.streamingEmissionByGPerCO2} gCO2e',
        icon: Icons.tv));
    metrics = metricsTemp;
  }

  @override
  void dispose() {}
}
