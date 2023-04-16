import '../../ui/widgets/models/surveys/survey_answer_model.dart';
import '../../ui/widgets/models/surveys/survey_question_model.dart';

final List<SurveyQuestionModel> surveyQuestions = [
    SurveyQuestionModel(
        question: 'Qual o aparelho eletrônico utilizado?',
        questionType: SurveyQuestionType.option,
        answerOptions: [
          SurveyAnswerModel(answer: 'Celular', imagePath: '', value: 0, description: 'Dispositivo móvel'),
          SurveyAnswerModel(answer: 'Computador', imagePath: '', value: 1),
          SurveyAnswerModel(answer: 'Tablet', imagePath: '', value: 2),
          SurveyAnswerModel(answer: 'TV', imagePath: '', value: 3),
        ],
        answerPrefix: '',
        answerSuffix: ''),
    SurveyQuestionModel(
        question: 'Qual a marca do dispositivo?',
        questionType: SurveyQuestionType.anyText,
        answerOptions: [],
        answerPrefix: '',
        answerSuffix: ''),
    SurveyQuestionModel(
        question: 'Qual o modelo do dispositivo?',
        questionType: SurveyQuestionType.anyText,
        answerOptions: [],
        answerPrefix: '',
        answerSuffix: ''),
    SurveyQuestionModel(
        question: 'O equipamento foi utilizado por',
        questionType: SurveyQuestionType.anyNumber,
        answerOptions: [],
        answerPrefix: '',
        answerSuffix: 'minutos'),
    SurveyQuestionModel(
        question: 'Qual foi a fonte de energia utilizada?',
        questionType: SurveyQuestionType.option,
        answerOptions: [
          SurveyAnswerModel(answer: 'Eletricidade', imagePath: '', value: 0),
          SurveyAnswerModel(answer: 'Energia Solar', imagePath: '', value: 1),
          SurveyAnswerModel(answer: 'Bateria', imagePath: '', value: 2),
        ],
        answerPrefix: '',
        answerSuffix: ''),
  ];