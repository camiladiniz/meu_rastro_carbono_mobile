class API {
  static Uri authenticate() =>
      Uri.https('meu-rastro-carbono.azurewebsites.net', '/account/login');
  static Uri getUserEvaluation(String userId) =>
      Uri.https('meu-rastro-carbono.azurewebsites.net', '/Evolution/$userId');
}
