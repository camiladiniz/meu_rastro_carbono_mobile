import '../../ui/widgets/models/surveys/survey_answer_model.dart';
import '../../ui/widgets/models/surveys/survey_question_model.dart';

final List<SurveyQuestionModel> electronicSurveyQuestions = [
  SurveyQuestionModel(
      question: 'Hoje o celular foi utilizado por',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: 'minutos'),
  SurveyQuestionModel(
      question: 'O computador/notebook foi utilizado por',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: 'minutos'),
  SurveyQuestionModel(
      question: 'A televisão foi utilizada por',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: 'minutos'),
  SurveyQuestionModel(
      question: 'Console de jogos foi utilizado por',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: 'minutos'),
  SurveyQuestionModel(
      question: 'Qual foi a fonte de energia utilizada?',
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(
            id: 1, answer: 'Eletricidade', imagePath: '', value: 0),
        SurveyAnswerModel(
            id: 1, answer: 'Energia Solar', imagePath: '', value: 1),
        SurveyAnswerModel(id: 1, answer: 'Bateria', imagePath: '', value: 2),
      ],
      answerPrefix: '',
      answerSuffix: ''),
];
