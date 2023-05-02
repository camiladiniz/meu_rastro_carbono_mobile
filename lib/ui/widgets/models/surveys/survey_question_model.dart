import 'survey_answer_model.dart';

class SurveyQuestionModel {
  final String? identification;
  final String question;
  final SurveyQuestionType questionType;
  final List<SurveyAnswerModel> answerOptions;
  final String answerPrefix;
  final String answerSuffix;
  String? description;
  String? userAnswer;

  SurveyQuestionModel(
      {this.identification,
      required this.question,
      required this.questionType,
      required this.answerOptions,
      required this.answerPrefix,
      required this.answerSuffix,
      this.description,
      this.userAnswer});
}

enum SurveyQuestionType { textAndImage, anyNumber, anyText, option }
