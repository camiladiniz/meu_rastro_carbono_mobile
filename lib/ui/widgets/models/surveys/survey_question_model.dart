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
  Function? skipQuestion;

  SurveyQuestionModel(
      {this.identification,
      required this.question,
      required this.questionType,
      required this.answerOptions,
      required this.answerPrefix,
      required this.answerSuffix,
      this.description,
      this.userAnswer,
      this.skipQuestion});
}

enum SurveyQuestionType {
  textAndImage,
  anyNumber,
  anyText,
  option,
  turnOnLamps,
  yesOrNo,
  foodConsumption
}

class QuestionTypeYesOrNo {
  static String get yes => 'Sim';
  static String get no => 'Não';
}
