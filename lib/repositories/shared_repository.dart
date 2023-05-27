import 'package:shared_preferences/shared_preferences.dart';

class SharedRepository {
  late SharedPreferences sharedPreferences;

  setSharedPreferences(SharedPreferences sharedPreferences) {
    this.sharedPreferences = sharedPreferences; 
  }

  setUsuarioLogado(bool value) async {
    await sharedPreferences.setBool('usu_logado', value);  
  }

  bool getUsuarioLogado() {
    return sharedPreferences.getBool('usu_logado') ?? false;
  }

  setNomeUsuario(bool value) async {
    await sharedPreferences.setBool('usu_nome', value);  
  }

}