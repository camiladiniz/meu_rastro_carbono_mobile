import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../infra/shared_preference_constants.dart';
import '../../../infra/shared_preference_service.dart';

Drawer drawerWidget(BuildContext context) {
  final SharedPreferencesService localStorage =
      Modular.get<SharedPreferencesService>();

  void onSelectItem(String pageName) {
    Navigator.pop(context); // close the drawer
    Modular.to.pushNamed(pageName);
  }

  void logout() async {
    await localStorage.initializeSharedPreferences();
    await localStorage.setBoolValue(
        SharedPreferenceConstants.isAuthenticated, false);
    await localStorage.setStringValue(SharedPreferenceConstants.name, '');
    await localStorage.setStringValue(SharedPreferenceConstants.token, '');
    await localStorage.setStringValue(SharedPreferenceConstants.userId, '');
    onSelectItem('/login');
  }

  return Drawer(
    child: Column(
      children: [
        UserAccountsDrawerHeader(
          accountEmail:
              const Text("v1.0.0", style: TextStyle(color: Colors.white)),
          accountName: const Text("Meu rastro de Carbono",
              style: TextStyle(color: Colors.white)),
          currentAccountPicture: GestureDetector(
            child: const CircleAvatar(
                backgroundImage: AssetImage('lib/ui/assets/images/leaf.png')),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                  leading: const Icon(Icons.library_books_rounded),
                  title: const Text("Créditos"),
                  onTap: () => onSelectItem('/references'),
                  iconColor: Colors.green,
                  textColor: Colors.black87,
                  titleTextStyle: const TextStyle(fontSize: 15))
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Sair"),
                onTap: logout,
                iconColor: Colors.green,
                textColor: Colors.black87,
                titleTextStyle: const TextStyle(fontSize: 15)),
          ),
        ),
      ],
    ),
  );
}
