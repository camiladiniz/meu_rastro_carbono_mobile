class API {
  static Uri authenticate() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/account/login');

  static Uri getUserEvaluation(String userId) =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/Evolution/$userId');

  static Uri getSurveyAnswersByDay() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/survey/answered');

  static Uri postWaterSurveyAnswer() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/survey/water');

  static Uri postFoodSurveyAnswer() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/survey/food');

  static Uri postElectronicSurveyAnswer() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/survey/electronics');

  static Uri postLocomotionSurveyAnswer() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/survey/locomotion');

  static Uri getUserMetrics(String userId) =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/metrics/user/$userId');

  static Uri getUserTips(String userId) =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/metrics/tips/$userId');

  static Uri getUserRewards(String userId) =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/rewards/user/$userId');

  static Uri registerNewUser() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/account/register');
}
