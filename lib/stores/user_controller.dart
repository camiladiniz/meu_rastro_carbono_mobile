import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/data/repositories/account_repository.dart';
import 'package:meu_rastro_carbono/domain/user/user_entity.dart';
import 'package:meu_rastro_carbono/infra/shared_preference_service.dart';
import 'package:mobx/mobx.dart';

import '../data/models/evolution/badge_model.dart';
import '../infra/shared_preference_constants.dart';
part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController extends Disposable with Store {
  final SharedPreferencesService localStorage =
      Modular.get<SharedPreferencesService>();
  final AccountRepository accountRepo = Modular.get<AccountRepository>();

  _UserController() {
    initializeSharedPreferences();
  }

  Future<void> initializeSharedPreferences() async {
    await localStorage.initializeSharedPreferences();
    getName();
  }

  @override
  void dispose() {}

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String name = "";

  @observable
  String registerDate = "";

  @observable
  String loginError = "";

  @observable
  List<BadgeModel> rewards = [];

  @action
  Future<String> authenticate(String userEmail, String userPassword) async {
    try {
      var response = await accountRepo
          .login(UserEntity(name: '', email: userEmail, password: userPassword));

      await localStorage.setBoolValue(
          SharedPreferenceConstants.isAuthenticated, true);
      await localStorage.setStringValue(
          SharedPreferenceConstants.name, response.name);
      await localStorage.setStringValue(
          SharedPreferenceConstants.token, response.token);
      await localStorage.setStringValue(
          SharedPreferenceConstants.userId, response.userId);
      Modular.to.navigate('/home/surveys');
          return response.name;
    } catch (ex) {
      loginError = "Dados inválidos";
      return "erro";
    }
  }

  @action
  Future<bool> register(String userName, String userEmail, String userPassword) async {
    try {
      var response = await accountRepo
          .register(UserEntity(name: userName, email: userEmail, password: userPassword));
      return true;
    } catch (ex) {
      loginError = "Verifique se os dados foram informados corretamente";
      return false;
    }
  }

  @action
  Future<bool> isAuthenticated() async {
    var isAuthenticated =
        localStorage.getBoolValue(SharedPreferenceConstants.isAuthenticated);
    var userName =
        await localStorage.getStringValue(SharedPreferenceConstants.name);
    var userId =
        await localStorage.getStringValue(SharedPreferenceConstants.userId);

    if (isAuthenticated == true && userName != "" && userId != "") {
      return true;
    }
    return false;
  }

  @action
  getName() async {
    name = await localStorage.getStringValue(SharedPreferenceConstants.name);
  }

  @action
  Future<void> cleanError() async {
    loginError = "";
  }

  @action
  Future getUserRewards() async {
    var userId =
        await localStorage.getStringValue(SharedPreferenceConstants.userId);

    var response = await accountRepo.getUserRewards(userId);
    rewards = response;
  }
}
