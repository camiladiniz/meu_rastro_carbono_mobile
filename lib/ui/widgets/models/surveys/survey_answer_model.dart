class SurveyAnswerModel {
  final String answer;
  final String imagePath;
  final int value;
  final String? description;

  SurveyAnswerModel(
      {required this.answer, required this.imagePath, required this.value, this.description});
}
