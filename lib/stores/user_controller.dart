import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/infra/shared_preference_service.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../infra/shared_preference_constants.dart';
part 'user_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController extends Disposable with Store {
    final SharedPreferencesService sharedPreferencesService = Modular.get<SharedPreferencesService>();


  _UserController() {
    initializeSharedPreferences();
  }

  Future<void> initializeSharedPreferences() async {
    await sharedPreferencesService.initializeSharedPreferences();
    await getName();
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
  void isAuthenticated(String email, String password) {
    email = email;
    password = password;
  }

  @action
  Future<void> getName() async {
    name = await sharedPreferencesService.getStringValue(SharedPreferenceConstants.name);
  }
}
