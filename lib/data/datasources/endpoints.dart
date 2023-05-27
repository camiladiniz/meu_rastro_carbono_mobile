class API {
  static Uri authenticate() =>
      Uri.https('meu-rastro-carbono.azurewebsites.net', '/account/login');
      
  static Uri getUserEvaluation(String userId) =>
      Uri.https('meu-rastro-carbono.azurewebsites.net', '/Evolution/$userId');

  static Uri getSurveyAnswersByDay() =>
      Uri.https('meu-rastro-carbono.azurewebsites.net', '/survey/answered');

  static Uri postWaterSurveyAnswer() =>
      Uri.https('meu-rastro-carbono.azurewebsites.net', '/survey/water');

  static Uri postFoodSurveyAnswer() =>
      Uri.https('meu-rastro-carbono.azurewebsites.net', '/survey/food');

  static Uri postElectronicSurveyAnswer() =>
      Uri.https('meu-rastro-carbono.azurewebsites.net', '/survey/electronic');

  static Uri postLocomotionSurveyAnswer() =>
      Uri.https('meu-rastro-carbono.azurewebsites.net', '/survey/locomotion');
}
