import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/infra/shared_preference_service.dart';
import 'package:mobx/mobx.dart';

import '../data/repositories/evolution_repository.dart';
import '../infra/shared_preference_constants.dart';
part 'user_evolution_controller.g.dart';

class UserEvolutionController = _UserEvolutionController
    with _$UserEvolutionController;

abstract class _UserEvolutionController extends Disposable with Store {
  final SharedPreferencesService localStorage =
      Modular.get<SharedPreferencesService>();
  final UserRevolutionRepository evolutionRepo =
      Modular.get<UserRevolutionRepository>();

  _UserEvolutionController() {
    initializeSharedPreferences();
  }

  Future<void> initializeSharedPreferences() async {
    await localStorage.initializeSharedPreferences();
  }

  @action
  Future<int> getUserElovutionPoints() async {
    var userId = await localStorage.getStringValue(SharedPreferenceConstants.userId);
    return await evolutionRepo.getUserEvolutionPontuation(userId);
  }

  @override
  void dispose() {}
}
