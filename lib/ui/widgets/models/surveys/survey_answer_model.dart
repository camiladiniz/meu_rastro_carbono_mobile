class SurveyAnswerModel {
  final int id;
  final String answer;
  final String imagePath;
  final int value;
  final String? description;

  SurveyAnswerModel(
      { required this.id, required this.answer, required this.imagePath, required this.value, this.description});
}
