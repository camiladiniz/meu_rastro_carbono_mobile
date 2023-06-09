class API {
  static Uri authenticate() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/account/login');

  static Uri getUserEvaluation() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/Evolution');

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

  static Uri getUserMetrics() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/metrics');

  static Uri getUserTips() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/metrics/tips');

  static Uri getUserRewards() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/rewards');

  static Uri registerNewUser() =>
      Uri.https('meu-rastro-de-carbono-v2.azurewebsites.net', '/account/register');
}
