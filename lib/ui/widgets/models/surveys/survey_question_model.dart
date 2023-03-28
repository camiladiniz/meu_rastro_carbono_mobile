import 'survey_answer_model.dart';

class SurveyQuestionModel {
  final String question;
  final SurveyQuestionType questionType;
  final List<SurveyAnswerModel> answerOptions;
  final String answerPrefix;
  final String answerSuffix;

  SurveyQuestionModel(
      {required this.question,
      required this.questionType,
      required this.answerOptions,
      required this.answerPrefix,
      required this.answerSuffix});
}

enum SurveyQuestionType { textAndImage, anyNumber, anyText, option }
