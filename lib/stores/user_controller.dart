import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/infra/shared_preference_service.dart';
import 'package:mobx/mobx.dart';

import '../infra/shared_preference_constants.dart';
part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController extends Disposable with Store {
  final SharedPreferencesService sharedPreferencesService =
      Modular.get<SharedPreferencesService>();

  _UserController() {
    initializeSharedPreferences();
  }

  Future<void> initializeSharedPreferences() async {
    await sharedPreferencesService.initializeSharedPreferences();
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

  @action
  void authenticate(String email, String password) {
    email = email;
    password = password;
    name = "Camila";
  }

  @action
  Future<bool> isAuthenticated() async {
    var isAuthenticated = sharedPreferencesService
        .getBoolValue(SharedPreferenceConstants.isAuthenticated);
    var userName = await sharedPreferencesService
        .getStringValue(SharedPreferenceConstants.name);

    if (isAuthenticated == true && userName != "") {
      return true;
    }
    return false;
  }

  @action
  Future<void> getName() async {
    name = await sharedPreferencesService
        .getStringValue(SharedPreferenceConstants.name);
  }
}
