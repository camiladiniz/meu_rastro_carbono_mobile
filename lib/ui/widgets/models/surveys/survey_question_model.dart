import 'survey_answer_model.dart';

class SurveyQuestionModel {
  final String question;
  final List<SurveyAnswerModel> answers;
  SurveyQuestionModel({required this.question, required this.answers});
}